import 'dart:convert';

import '../../dto/display/menu/menu.dto.dart';
import '../remote/display.api.dart';
import 'display,mock.data.dart';

class DisplayMockApi implements DisplayApi {
  @override
  Future<List<MenuDto>> getMenusByMallType(String mallType) {
    return Future(
          () => menuParser(
        mallType == 'market'
            ? DisplayMockData.menusByMarket
            : DisplayMockData.menusByBeauty,
      ),
    );
  }

  // parsers
  List<MenuDto> menuParser(String source) {
    List<MenuDto> menus = [];
    final List json = jsonDecode(source);
    menus = json.map((e) => MenuDto.fromJson(e)).toList();

    return menus;
  }
}