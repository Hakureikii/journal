import 'package:flutter/material.dart';

class JakartaText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final TextOverflow? overflow;
  const JakartaText({
    super.key,
    required this.text,
    this.fontWeight,
    this.color,
    this.fontSize,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: 'PlusJakartaSans',
        fontWeight: fontWeight,
        color: color,
        overflow: overflow,
      ),
    );
  }
}

class PlayFairText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final TextOverflow? overflow;
  const PlayFairText({
    super.key,
    required this.text,
    this.fontWeight,
    this.color,
    this.fontSize,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: 'PlayFair',
        fontWeight: fontWeight,
        color: color,
        overflow: overflow,
      ),
    );
  }
}

class JetBrainsText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final TextOverflow? overflow;
  const JetBrainsText({
    super.key,
    required this.text,
    this.fontWeight,
    this.color,
    this.fontSize,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: 'JetBrains',
        fontWeight: fontWeight,
        color: color,
        overflow: overflow,
      ),
    );
  }
}
