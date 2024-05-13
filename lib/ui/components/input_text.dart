import 'package:flashchat_medium/ui/style/textstyles.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final String? hint;
  final IconData icon;
  final bool isRequired;
  final bool isNotVisible;
  final TextEditingController controller;
  final Widget? suffix;

  const InputText(
      {super.key,
      this.suffix,
      this.isRequired = false,
      this.isNotVisible = false,
      required this.icon,
      required this.controller,
      required this.label,
      this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        obscureText: isNotVisible,
        validator: (value) {
          if (isRequired) {
            switch (value) {
              case null || '':
                return 'please fill the column !';
              default:
                return null;
            }
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          label: Text(label),
          labelStyle: TextStyles.formLabel,
          floatingLabelStyle: TextStyles.formLabel,
          hintText: hint,
          hintStyle: TextStyles.formHint,
          errorStyle: TextStyles.formErr,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            // vertical: 10,
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
          suffix: suffix,
        ),
        style: TextStyles.formVal,
        controller: controller,
      ),
    );
  }
}
