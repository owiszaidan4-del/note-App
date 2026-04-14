import 'package:flutter/material.dart';
import 'package:test/Static.dart';

// ignore: must_be_immutable
class customTextField extends StatelessWidget {
  customTextField({
    super.key,
    required this.hight,
    required this.Hint,
    required this.validat,
    required this.textEditingController,
    this.onSaved,
  });
  void Function(String?)? onSaved;
  final double hight;

  final String Hint;
  final TextEditingController textEditingController;
  String? Function(String?)? validat;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: TextFormField(
        onSaved: onSaved,
        controller: textEditingController,
        validator: validat,
        decoration: InputDecoration(
          hint: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Hint,
              style: TextStyle(fontSize: 15, color: kColorTextsheets),
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: EdgeInsets.symmetric(vertical: hight),
        ),
      ),
    );
  }
}
