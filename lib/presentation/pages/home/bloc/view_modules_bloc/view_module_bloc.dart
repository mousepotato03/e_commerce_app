import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/constant.dart';
import '../../../../../core/util/error/error_response.dart';
import '../../../../../core/util/exception/common_exception.dart';
import '../../../../../core/util/logger.dart';
import '../../../../../domain/model/common/result.dart';
import '../../../../../domain/model/display/display.model.dart';
import '../../../../../domain/usecase/display/display.usecase.dart';
import '../../../../../domain/usecase/display/view_module/get_view_modules.usecase.dart';
import '../../component/view_module_list/view_module_factory/view_module_factory.dart';

part 'view_module_event.dart';

part 'view_module_state.dart';

part 'view_module_bloc.freezed.dart';

class ViewModuleBloc extends Bloc<ViewModuleEvent, ViewModuleState> {
  final DisplayUsecase _displayUsecase;

  ViewModuleBloc(this._displayUsecase) : super(ViewModuleState()) {
    on<ViewModuleInitialized>(_onViewModuleInitialized);
  }

  Future<void> _onViewModuleInitialized(
    ViewModuleInitialized event,
    Emitter<ViewModuleState> emit,
  ) async {
    try {
      final tabId = event.tabId;

      emit(state.copyWith(status: Status.loading));
      await Future.delayed(Duration(seconds: 1));

      final response = await _fetch(tabId);
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

  Future<Result<List<ViewModule>>> _fetch(int tabId) async {
    return await _displayUsecase.excute(
      usecase: GetViewModulesUsecase(tabId: tabId),
    );
  }
}
