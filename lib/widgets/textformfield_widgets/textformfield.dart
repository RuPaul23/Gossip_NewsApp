import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextformFieldWidget extends StatelessWidget {
  TextEditingController textEditingController;
  TextformFieldWidget({
    required this.textEditingController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
    );
  }
}

              