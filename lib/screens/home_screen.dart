import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/font_size.dart';
import '../widgets/texts.dart';
import '../widgets/buttons.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onWriteNote;
  const HomeScreen({super.key, required this.onWriteNote});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.64,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: const Card(
                elevation: 5,
                color: AppColors.transparentPink,
                child: Icon(
                  Icons.drive_file_rename_outline,
                  size: 90,
                  color: AppColors.darkPink,
                ),
              ),
            ),

            SizedBox(height: 20),

            const PlayFairText(
              text: 'Your Sweet Safe Space',
              fontSize: FontSize.big,
              fontWeight: FontWeight.bold,
            ),

            const SizedBox(
              child: JakartaText(
                text:
                    'Capture daily moments, express pure feelings, and look back with gratitude.',
                color: AppColors.pink,
                fontSize: FontSize.medium,
              ),
            ),

            const SizedBox(
              child: JakartaText(
                text: 'Let your mind flourish',
                color: AppColors.darkPink,
                fontSize: FontSize.medium,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 300,
              height: 40,
              child: Buttons(
                onPressed: widget.onWriteNote,
                icon: const Icon(Icons.add),
                label: const JakartaText(
                  text: 'Write A Journal Today',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
