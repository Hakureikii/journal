import 'package:flutter/material.dart';

class JakartaText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  const JakartaText({
    super.key,
    required this.text,
    this.fontWeight,
    this.color,
    this.fontSize
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
      ),
    );
  }
}


class PlayFairText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  const PlayFairText({
    super.key,
    required this.text,
    this.fontWeight,
    this.color,
    this.fontSize
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
      ),
    );
  }
}

class JetBrainsText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  const JetBrainsText({
    super.key,
    required this.text,
    this.fontWeight,
    this.color,
    this.fontSize
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
      ),
    );
  }
}
