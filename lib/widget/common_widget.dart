import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/colors.dart';

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
            width: 6.w,
          ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                color: color,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget inputTextFieldWithIcon({
  required TextInputType type,
  required String labelTxt,
  required String hintTxt,
  required Icon icon,
  bool? readOnly,
  bool? obscure,
  TextEditingController? controller,
}) {
  return TextFormField(
    obscureText: obscure ?? false,
    textInputAction: TextInputAction.next,
    validator: (value) {
      if (value != null && value.isEmpty) {
        return "Can't be empty";
      } else if (type == TextInputType.emailAddress) {
        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!)) {
          return "Please enter a valid email address";
        } else {
          return null;
        }
      } else if (type == TextInputType.visiblePassword) {
        if (value!.length < 6) {
          return "Password should be at least 6 characters";
        }
      } else {
        return null;
      }
    },
    keyboardType: type,
    controller: controller,
    readOnly: readOnly ?? false,
    style: GoogleFonts.bebasNeue(
      color: kTextFeildClr,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    ),
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      fillColor: textfieldBG,
      filled: true,
      suffixIcon: icon,
      suffixIconColor: primaryColor,
      labelText: labelTxt,
      hintText: hintTxt,
      labelStyle: GoogleFonts.bebasNeue(
        fontSize: 13.sp,
        color: const Color(0xFF9E9E9E),
        fontWeight: FontWeight.w500,
      ),
      hintStyle: GoogleFonts.bebasNeue(
        fontSize: 13.sp,
        color: const Color(0xFF9E9E9E),
        fontWeight: FontWeight.w500,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color: primaryColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

Widget numberInputTextFieldWithIcon({
  required String labelTxt,
  required String hintTxt,
  TextEditingController? controller,
}) {
  return TextFormField(
    validator: (value) {
      if (value != null && value.isEmpty) {
        return "Can't be empty";
      } else {
        return null;
      }
    },
    controller: controller,
    inputFormatters: [
      LengthLimitingTextInputFormatter(10),
    ],
    keyboardType: TextInputType.phone,
    textInputAction: TextInputAction.next,
    style: GoogleFonts.bebasNeue(
      color: kTextFeildClr,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    ),
    decoration: InputDecoration(
      fillColor: textfieldBG,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      filled: true,
      prefix: Text(
        "+91 ",
        style: GoogleFonts.bebasNeue(
          color: kTextFeildClr,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      labelText: labelTxt,
      suffixIcon: const Icon(
        Iconsax.call,
        color: kTextFeildClr,
      ),
      hintText: hintTxt,
      labelStyle: GoogleFonts.bebasNeue(
        fontSize: 13.sp,
        color: const Color(0xFF9E9E9E),
      ),
      hintStyle: GoogleFonts.bebasNeue(
        fontSize: 13.sp,
        color: const Color(0xFF9E9E9E),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color: primaryColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

Widget textBtn({
  required Color bgClr,
  required Function function,
  required String text,
  required Color color,
  Color? borderClr,
}) {
  return TextButton(
    style: TextButton.styleFrom(
      backgroundColor: bgClr,
      minimumSize: const Size(double.infinity, 50),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
    ),
    onPressed: () => function(),
    child: Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          color: color,
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

// FLUTTER TOAST
Future<bool?> toast({
  required String text,
}) {
  return Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: primaryColor,
    textColor: Colors.white,
    fontSize: 14.0,
  );
}

//EXIT DIALOG
Future exitPopUp(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Exit App'),
      content: const Text('Do you want to exit an App?'),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('No'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Yes'),
        ),
      ],
    ),
  );
}
