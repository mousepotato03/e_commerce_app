import 'dart:convert';

import '../../dto/common/response_wrapper/response_wrapper.dart';
import '../../dto/display/menu/menu.dto.dart';
import '../../dto/display/view_module/view_module.dto.dart';
import '../remote/display.api.dart';
import 'display,mock.data.dart';

class DisplayMockApi implements DisplayApi {
  @override
  Future<ResponseWrapper<List<MenuDto>>> getMenusByMallType(String mallType) {
    /*error_test*/

    // return Future.delayed(
    //   const Duration(milliseconds: 400),
    //   () => ResponseWrapper(
    //     status: 'fail',
    //     code: 'GNB-0000',
    //     message: '서비스 에러가 발생했습니다.\n 잠시 후에 다시 시도해주세요.',
    //   ),
    // );

    /*success_test*/

    return Future.delayed(
      const Duration(milliseconds: 400),
      () => ResponseWrapper(
        status: 'SUCCESS',
        code: '0000',
        message: '',
        data: menuParser(
          mallType == 'market'
              ? DisplayMockData.menusByMarket
              : DisplayMockData.menusByBeauty,
        ),
      ),
    );
  }

  @override
  Future<ResponseWrapper<List<ViewModuleDto>>> getViewModulesByTabId(
      int tabId) {
    late String source;
    final endOfTabId = tabId % 10;
    switch (endOfTabId) {
      case 1:
        source = DisplayMockData.viewModulesByTabIdCaseOne;
      case 2:
        source = DisplayMockData.viewModulesByTabIdCaseTwo;
      case 3:
        source = DisplayMockData.viewModulesByTabIdCaseThree;
      case 4:
        source = DisplayMockData.viewModulesByTabIdCaseFour;
      case 5:
        source = DisplayMockData.viewModulesByTabIdCaseFive;
    }

    return Future.delayed(
      const Duration(milliseconds: 400),
      () => ResponseWrapper(
        status: 'SUCCESS',
        code: '0000',
        message: '',
        data: viewModuleParser(source),
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

  List<ViewModuleDto> viewModuleParser(String source) {
    List<ViewModuleDto> viewModules = [];
    final List json = jsonDecode(source);
    viewModules = json.map((e) => ViewModuleDto.fromJson(e)).toList();

    return viewModules;
  }
}
