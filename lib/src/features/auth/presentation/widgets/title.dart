import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DebtNoteTitle extends StatelessWidget {
  const DebtNoteTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Debt",
          style: TextStyle(
              fontFamily: 'DeathNote',
              fontSize: 64.sp,
              color: const Color(0xFFF92C2C)),
        ),
        Text(
          "Note",
          style: TextStyle(
              fontFamily: 'DeathNote', fontSize: 64.sp, color: Colors.white),
        ),
      ],
    );
  }
}
