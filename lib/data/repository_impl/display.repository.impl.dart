import 'package:e_commerce_app/core/constant.dart';

import '../../domain/model/display/menu/menu.model.dart';
import '../../domain/model/display/view_module/view_module.model.dart';
import '../../domain/repository/display.repository.dart';
import '../data_source/remote/display.api.dart';
import '../dto/common/response_wrapper/response_wrapper.dart';
import '../mapper/common.mapper.dart';
import '../mapper/display.mapper.dart';

class DisplayRepositoryImpl implements DisplayRepository {
  final DisplayApi _displayApi;

  DisplayRepositoryImpl(this._displayApi);

  @override
  Future<ResponseWrapper<List<Menu>>> getMenuByMallType(
      {required MallType mallType}) async {
    final response = await _displayApi.getMenusByMallType(mallType.name);

    return response.toModel<List<Menu>>(
      response.data?.map((dto) => dto.toModel()).toList() ?? [],
    );
  }

  @override
  Future<ResponseWrapper<List<ViewModule>>> getViewModuleByTabId({
    required int tabId,
    required int page,
  }) async {
    final response = await _displayApi.getViewModulesByTabId(tabId,page);

    return response.toModel<List<ViewModule>>(
      response.data?.map((dto) => dto.toModel()).toList() ?? [],
    );
  }
}
