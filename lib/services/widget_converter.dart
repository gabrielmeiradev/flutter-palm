import 'package:flutter/material.dart';

import 'package:playground/services/widgets/date.dart';
import 'package:playground/services/widgets/dropdown.dart';
import 'package:playground/services/widgets/textfield.dart';

Widget widgetConverter(Map<String, dynamic> option) {
  switch(option['tipo']){
    case "date": 
      return DateInput(option: option);
    case "textfield":
      return TextfieldInput(option: option);
    case "dropdown":
      return Dropdown(option: option);
    default:
      return Text(option['tipo']);
  }
}