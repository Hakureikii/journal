import 'package:flutter/material.dart';
import 'package:journal/utils/colors.dart';

class Buttons extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget label;
  final Widget icon;

  const Buttons({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: label,
      icon: icon,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
        ),
        textStyle: const TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: AppColors.darkPink,
        foregroundColor: Colors.white,
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget label;
  final Widget icon;

  const CancelButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      label: label,
      icon: icon,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.darkPink, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
        ),
        textStyle: const TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontWeight: FontWeight.bold,
        ),
        foregroundColor: AppColors.darkPink,
      ),
    );
  }
}
