import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool autofocus;
  final IconData icon;

  FormTextField({
    this.controller,
    this.label,
    this.hint,
    this.autofocus = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(end: 4.0),
            child: icon != null
                ? Icon(icon)
                : null, // myIcon is a 48px-wide widget.
          ),
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(),
        ),
        autofocus: autofocus,
        keyboardType: TextInputType.number,
      ),
    );
  }
}
