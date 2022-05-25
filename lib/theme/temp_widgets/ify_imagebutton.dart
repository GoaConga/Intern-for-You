import 'package:flutter/material.dart';
import 'package:internsforyou/theme/ify_custom_theme.dart';


Widget imageButton(VoidCallback whenTapped, AssetImage imagesrc, double height, String text, Alignment textAlign) {
  return GestureDetector(
    onTap: whenTapped,
    child: Container(
      constraints: BoxConstraints(maxHeight: height),
      child: Stack(
        alignment: textAlign,
        children: [
          Image(
            image: imagesrc,
            fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(text, style: IFYFonts.imageButtonText),
          ),
        ],
      ),
    ),
  );
}