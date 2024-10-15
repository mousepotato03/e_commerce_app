import 'package:get_it/get_it.dart';

import 'data/data_source/mock/display_mock_api.dart';
import 'data/data_source/remote/display.api.dart';
import 'data/repository_impl/display.repository.impl.dart';
import 'domain/repository/display.repository.dart';
import 'domain/usecase/display/display.usecase.dart';
import 'presentation/pages/home/bloc/menu_bloc/menu_bloc.dart';
import 'presentation/pages/home/bloc/view_modules_bloc/view_module_bloc.dart';

final locator = GetIt.instance;

void setLocator(){
  _data();
  _domain();
  _presentation();
}

void _data(){
  locator.registerSingleton<DisplayApi>(DisplayMockApi());
}

void _domain(){
  //repo
  locator.registerSingleton<DisplayRepository>(DisplayRepositoryImpl(locator<DisplayApi>()));

  //usecase
  locator.registerSingleton<DisplayUsecase>(DisplayUsecase(locator<DisplayRepository>()));
}

void _presentation(){
  locator.registerFactory(()=> MenuBloc(locator<DisplayUsecase>()));

  locator.registerFactory(()=> ViewModuleBloc(locator<DisplayUsecase>()));
}