import 'dart:convert';

import '../../dto/common/response_wrapper/response_wrapper.dart';
import '../../dto/display/menu/menu.dto.dart';
import '../remote/display.api.dart';
import 'display,mock.data.dart';

class DisplayMockApi implements DisplayApi {
  @override
  Future<ResponseWrapper<List<MenuDto>>> getMenusByMallType(String mallType) {
    return Future(() => ResponseWrapper(
          status: "SUCCESS",
          code: "0000",
          message: '',
          data: menuParser(
            mallType == 'market'
                ? DisplayMockData.menusByMarket
                : DisplayMockData.menusByBeauty,
          ),
        ));
  }

  // parsers
  List<MenuDto> menuParser(String source) {
    List<MenuDto> menus = [];
    final List json = jsonDecode(source);
    menus = json.map((e) => MenuDto.fromJson(e)).toList();

    return menus;
  }
}
