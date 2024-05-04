import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String? title, weight,family;
  final double? size;
  final clr;
  final bool? center,lineThrough;
  final int? line;
  final double? letterSpacing;

  MyText(
      {this.title,
        this.size,
        this.clr,
        this.weight,
        this.family,
        this.center=true,
        this.lineThrough=false,
        this.line, this.letterSpacing,
        });

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      maxLines: line,
      textScaleFactor: 1,
      style: TextStyle(
          decoration: lineThrough==true ?  TextDecoration.lineThrough :TextDecoration.none,
          fontFamily: family,
          fontSize: size,
          color: clr,
          letterSpacing: letterSpacing,
          fontWeight: weight == null
              ? FontWeight.w700
              : weight == "Bold"
              ? FontWeight.w600
              : weight == "Semi Bold"
              ? FontWeight.w500
              : FontWeight.normal),
      textAlign: center == true
          ? TextAlign.center
          : TextAlign.left,
    );
  }
}
