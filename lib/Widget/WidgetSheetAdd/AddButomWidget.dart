import 'package:flutter/material.dart';
import 'package:test/Static.dart';

// ignore: must_be_immutable
class AddBoutom extends StatelessWidget {
  AddBoutom({super.key, required this.ontap});
  Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 50),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: kColorTextsheets,
          ),
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(
              "Add",

              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
