import 'package:e_commerce_app/presentation/pages/home/component/view_module_list/view_module_factory/view_module_widget.dart';
import 'package:flutter/material.dart';

class ViewModuleNONE extends StatelessWidget with ViewModuleWidget{
  const ViewModuleNONE({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrangeAccent,
      height: 200,
      child: Center(child: Text("ViewModuleNONE"),),
    );
  }
}