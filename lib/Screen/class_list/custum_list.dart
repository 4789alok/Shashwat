import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final double? textHight;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign align;
  final int? maxline;
  const CustomText({
    Key? key,
    required this.text,
    this.size = 20,
    this.textHight,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.align = TextAlign.center,
    this.maxline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxline,
      overflow: (maxline != null) ? TextOverflow.ellipsis : null,
      style: TextStyle(
        height: textHight,
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
