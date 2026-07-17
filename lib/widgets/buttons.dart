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

// class StarredButton extends StatefulWidget {
//   final VoidCallback onPressed;
//   final Widget label;
//   const StarredButton({
//     super.key,
//     required this.label,
//     required this.onPressed,
//   });

//   @override
//   State<StarredButton> createState() => _StarredButtonState();
// }

// class _StarredButtonState extends State<StarredButton> {
//   @override
//   Widget build(BuildContext context) {
//     return OutlinedButton.icon(
//       style: ButtonStyle(),
//       onPressed: widget.onPressed,
//       label: widget.label,
//       icon: Icon(Icons.bookmark, color: AppColors.darkPink,),
//     );
//   }
// }
