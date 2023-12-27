import 'package:flutter/material.dart';

/// Flutter code sample for [DropdownMenu].

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class Dropdown extends StatefulWidget {
  const Dropdown({super.key, required this.option});

  final Map<String, dynamic> option;
  
  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String dropdownValue = list.first;

  // final bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuEntry<String>> dropdownEntries = [];

    widget.option['lista'].forEach((key, value) {
      dropdownEntries.add(DropdownMenuEntry(value: key, label: value));
    });


    return DropdownMenu<String>(
      initialSelection: dropdownEntries.first.value,
      label: Text(widget.option['titulo']),
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: dropdownEntries
    );
  }
}
