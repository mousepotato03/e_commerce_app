part of 'view_module_bloc.dart';

@freezed
class ViewModuleState with _$ViewModuleState {
  const factory ViewModuleState({
    @Default(Status.initial) Status status,
    @Default(-1) int tabId,
    @Default(1) int currentPage,
    @Default(false) bool inEndOfPage,
    @Default(<Widget>[]) List<Widget> viewModules,
    @Default(ErrorResponse()) ErrorResponse error,
  }) = _ViewModuleState;
}