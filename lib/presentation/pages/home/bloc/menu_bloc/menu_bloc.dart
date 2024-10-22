import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/constant.dart';
import '../../../../../core/util/error/error_response.dart';
import '../../../../../core/util/exception/common_exception.dart';
import '../../../../../core/util/logger.dart';
import '../../../../../domain/model/common/result.dart';
import '../../../../../domain/model/display/menu/menu.model.dart';
import '../../../../../domain/usecase/display/display.usecase.dart';
import '../../../../../domain/usecase/display/menu/get_menus_usecase.dart';

part 'menu_bloc.freezed.dart';
part 'menu_event.dart';
part 'menu_state.dart';

@injectable
class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final DisplayUsecase _displayUsecase;

  MenuBloc(this._displayUsecase) : super(MenuState()) {
    on<MenuInitialized>(_onMenuInitialized);
  }

  Future<void> _onMenuInitialized(
    MenuInitialized event,
    Emitter<MenuState> emit,
  ) async {
    final mallType = event.mallType;

    emit(state.copyWith(status: Status.loading));
    await Future.delayed(Duration(seconds: 2));
    try {
      final response = await _fetch(mallType);
      response.when(
        success: (menus) {
          emit(
            state.copyWith(
              status: Status.success,
              menus: menus,
              mallType: mallType,
            ),
          );
        },
        failure: (error) {
          emit(
            state.copyWith(
              status: Status.error,
              error: error,
            ),
          );
        },
      );
    } catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(
          status: Status.error, error: CommonException.setError(error)));
    }
  }

  Future<Result<List<Menu>>> _fetch(MallType mallType) async {
    return await _displayUsecase.execute(
      usecase: GetMenusUsecase(mallType: mallType),
    );
  }
}
