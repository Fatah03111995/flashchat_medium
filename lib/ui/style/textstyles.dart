import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle get general => GoogleFonts.poppins(
      fontWeight: FontWeight.normal, fontSize: 18, fontStyle: FontStyle.normal);

  static TextStyle get s => general.copyWith(fontSize: 7);
  static TextStyle get sBold => s.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get sm => general.copyWith(fontSize: 10);
  static TextStyle get smBold => sm.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get m => general.copyWith(fontSize: 15);
  static TextStyle get mBold => m.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get ml => general.copyWith(fontSize: 25);
  static TextStyle get mlBold => ml.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get l => general.copyWith(fontSize: 40);
  static TextStyle get lBold => l.copyWith(fontWeight: FontWeight.bold);
  static TextStyle get xl => general.copyWith(fontSize: 60);
  static TextStyle get xlBold => xl.copyWith(fontWeight: FontWeight.bold);

  static TextStyle get button => mBold.copyWith(color: Colors.white);

  static TextStyle get formHint => sm.copyWith(
        color: Colors.grey.shade700.withOpacity(0.8),
      );
  static TextStyle get formErr => smBold.copyWith(color: Colors.red);
  static TextStyle get formLabel => mBold.copyWith(color: Colors.blue);
  static TextStyle get formVal => m.copyWith(color: Colors.blue);

  static TextStyle get errSnackbar => m.copyWith(color: Colors.red[700]);
  static TextStyle get successSnackbar => m.copyWith(color: Colors.green[700]);

  static TextStyle get senderBubble => sm.copyWith(color: Colors.grey[200]);
  static TextStyle get textBubble => m.copyWith(color: Colors.white);
}
