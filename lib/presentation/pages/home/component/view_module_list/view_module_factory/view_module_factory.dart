import 'package:flutter/cupertino.dart';

import '../../../../../../core/extensions.dart';
import '../../../../../../domain/model/display/display.model.dart';
import '../view_module_A.dart';
import '../view_module_B.dart';
import '../view_module_C.dart';
import '../view_module_D.dart';
import '../view_module_E.dart';
import '../view_module_NONE.dart';
import 'view_module_widget.dart';

enum Modules {
  viewModuleA,
  viewModuleB,
  viewModuleC,
  viewModuleD,
  viewModuleE,
}

class ViewModuleFactory{
  Widget textToWidget(ViewModule viewModule){
    final String type = viewModule.type.toSnakeCase();
    for(final module in Modules.values){
      final String name = module.name.toSnakeCase();
      if(name.contains(type)){
        return module.toWidget() as Widget;
      }
    }
    return const ViewModuleNONE();
  }
}

extension ModulesX on Modules{
  ViewModuleWidget toWidget(){
    switch(this){
      case Modules.viewModuleA:
        return const ViewModuleA();
      case Modules.viewModuleB:
        return const ViewModuleB();
      case Modules.viewModuleC:
        return const ViewModuleC();
      case Modules.viewModuleD:
        return const ViewModuleD();
      case Modules.viewModuleE:
        return const ViewModuleE();
    }
  }
}
