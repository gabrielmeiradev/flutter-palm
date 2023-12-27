import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';


class DateInput extends StatelessWidget {
  const DateInput({super.key, required this.option});

  final Map<String, dynamic> option;
  @override
  Widget build(BuildContext context) {
    var initialDate = DateFormat("dd/MM/yy").parse(option["initialDate"]);
    var finalDate = DateFormat("dd/MM/yy").parse(option["finalDate"]);
    return DateTimePicker(
      type: DateTimePickerType.date,
      icon: const Icon(Icons.event),
      initialValue: option['id'] == "DATA_DE" ? initialDate.toString() : finalDate.toString(),
      firstDate: DateTime(initialDate.year),
      lastDate: DateTime(finalDate.year + 1),
      dateLabelText: option['titulo'],
      onChanged: (val) {},
      validator: (val) {
        return null;
      },
      onSaved: (val) => print(val),
    );
  }

}