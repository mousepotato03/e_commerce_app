import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../../../core/constant.dart';
import '../../../../../core/util/error/error_response.dart';
import '../../../../../core/util/exception/common_exception.dart';
import '../../../../../core/util/logger.dart';
import '../../../../../domain/model/common/result.dart';
import '../../../../../domain/model/display/display.model.dart';
import '../../../../../domain/usecase/display/display.usecase.dart';
import '../../../../../domain/usecase/display/view_module/get_view_modules.usecase.dart';
import '../../component/view_module_list/view_module_factory/view_module_factory.dart';

part 'view_module_bloc.freezed.dart';

part 'view_module_event.dart';

part 'view_module_state.dart';

EventTransformer<E> _throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

@injectable
class ViewModuleBloc extends Bloc<ViewModuleEvent, ViewModuleState> {
  final DisplayUsecase _displayUsecase;

  ViewModuleBloc(this._displayUsecase) : super(ViewModuleState()) {
    on<ViewModuleInitialized>(_onViewModuleInitialized);
    on<ViewModuleFetched>(_onViewModuleFetched,
        transformer: _throttleDroppable(Duration(milliseconds: 400)));
  }

  Future<void> _onViewModuleInitialized(
    ViewModuleInitialized event,
    Emitter<ViewModuleState> emit,
  ) async {
    try {
      final tabId = event.tabId;
      if (event.isRefresh) {
        emit(state.copyWith(
          status: Status.initial,
          currentPage: 1,
          inEndOfPage: false,
          viewModules: [],
        ));
      }

      emit(state.copyWith(status: Status.loading));

      final response = await _fetch(tabId: tabId, isRefresh: event.isRefresh);
      response.when(
        success: (data) {
          ViewModuleFactory viewModuleFactory = ViewModuleFactory();
          final List<Widget> viewModules =
              data.map((e) => viewModuleFactory.textToWidget(e)).toList();
          emit(
            state.copyWith(
              status: Status.success,
              tabId: tabId,
              viewModules: viewModules,
            ),
          );
        },
        failure: (error) {
          emit(state.copyWith(status: Status.error, error: error));
        },
      );
    } catch (e) {
      CustomLogger.logger.e(e);
      emit(state.copyWith(
          status: Status.error, error: CommonException.setError(e)));
    }
  }

  Future<Result<List<ViewModule>>> _fetch({
    required int tabId,
    int page = 1,
    required bool isRefresh,
  }) async {
    return await _displayUsecase.execute(
      usecase: GetViewModulesUsecase(
        tabId: tabId,
        page: page,
        isRefresh: isRefresh,
      ),
    );
  }

  Future<void> _onViewModuleFetched(
    ViewModuleFetched event,
    Emitter<ViewModuleState> emit,
  ) async {
    if (state.inEndOfPage) return;
    final nextPage = state.currentPage + 1;
    final tabId = state.tabId;

    emit(state.copyWith(status: Status.loading));

    try {
      final response =
          await _fetch(tabId: tabId, page: nextPage, isRefresh: false);
      response.when(
        success: (data) {
          if (data.isEmpty) {
            emit(state.copyWith(
              status: Status.success,
              currentPage: nextPage,
              inEndOfPage: true,
            ));
            return;
          }

          final List<Widget> viewModules = [...state.viewModules];
          ViewModuleFactory viewModuleFactory = ViewModuleFactory();
          viewModules.addAll(List.generate(data.length,
              (index) => viewModuleFactory.textToWidget(data[index])));
          emit(
            state.copyWith(
              status: Status.success,
              tabId: tabId,
              viewModules: viewModules,
            ),
          );
        },
        failure: (error) {
          emit(state.copyWith(status: Status.error, error: error));
        },
      );
    } catch (e) {
      CustomLogger.logger.e(e);
      emit(state.copyWith(
          status: Status.error, error: CommonException.setError(e)));
    }
  }
}
