import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptiveDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime)? onDateChanged;

  const AdaptiveDatePicker({
    this.selectedDate,
    this.onDateChanged,
    super.key,
  });

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;

      onDateChanged!(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? SizedBox(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2023),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChanged!,
            ),
          )
        : Container(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedDate == null
                        ? 'No date selected'
                        : 'Selected Date: ${DateFormat('dd/MM/y').format(selectedDate!)}',
                  ),
                ),
                TextButton(
                  child: Text(
                    'Select date',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () => _showDatePicker(context),
                ),
              ],
            ),
          );
  }
}
