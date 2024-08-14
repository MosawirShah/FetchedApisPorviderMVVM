import 'package:flutter/material.dart';

class DropDownMenueButton extends StatefulWidget {
  const DropDownMenueButton({Key? key}) : super(key: key);

  @override
  State<DropDownMenueButton> createState() => _DropDownMenueButtonState();
}

class _DropDownMenueButtonState extends State<DropDownMenueButton> {

  String currentModel = "Model1";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: currentModel,
        items: [],
        onChanged: (value){
         setState(() {
           currentModel = value.toString();
         });
        });
  }

  //DropDownBtnItem
List<String> models = [
  'Model1',
  'Model2',
  'Model3',
  'Model4',
  'Model5',
  'Model6',
];
}
