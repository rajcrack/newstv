// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LayoutUtils {
  static Widget iconText(Icon iconWidget, Text textWidget) {
    return Row(
      children: [
        iconWidget,
        const SizedBox(
          width: 5,
        ),
        textWidget
      ],
    );
  }
}
