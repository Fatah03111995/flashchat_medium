import 'package:flashchat_medium/ui/style/textstyles.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final String? hint;
  final IconData icon;
  final TextEditingController controller;

  const InputText(
      {super.key,
      required this.icon,
      required this.controller,
      required this.label,
      this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        decoration: InputDecoration(
          label: Text(label),
          labelStyle: TextStyles.formLabel,
          hintText: hint,
          hintStyle: TextStyles.formHint,
          errorStyle: TextStyles.formErr,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.blue)),
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
          icon: Icon(
            icon,
            size: 30,
            color: Colors.blue,
          ),
        ),
        style: TextStyles.formVal,
        controller: controller,
      ),
    );
  }
}
