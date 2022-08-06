import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget text({
  required String text,
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.center,
    style: GoogleFonts.bebasNeue(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}

Widget textBtnWithIcon(
    {required Color primaryClr,
    required Color bgClr,
    required double size,
    required Function function,
    required String text,
    required Color color,
    required double fontSize,
    double? width,
    required IconData iconV,
    required FontWeight fontWeight,
    double? borderWidth,
    double? radius}) {
  return TextButton(
    style: TextButton.styleFrom(
      primary: primaryClr,
      backgroundColor: bgClr,
      minimumSize: Size(width ?? double.infinity, size),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 0),
        side: BorderSide(
          color: primaryClr,
          width: borderWidth ?? 0,
        ),
      ),
    ),
    onPressed: () => function(),
    child: Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconV),
          SizedBox(
            width: 5.w,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ],
      ),
    ),
  );
}
