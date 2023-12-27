import 'package:flutter/material.dart';

import 'package:playground/widget_converter/widgets/date.dart';
import 'package:playground/widget_converter/widgets/dropdown.dart';
import 'package:playground/widget_converter/widgets/textfield.dart';

class WidgetConverter {
  static Widget fromJson(Map<String, dynamic> json) => _widgetConverter(json);
}

Widget _widgetConverter(Map<String, dynamic> option) {
  switch(option['tipo'])  {
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