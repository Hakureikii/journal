import 'package:flutter/material.dart';
import '../widgets/buttons.dart';
import 'package:journal/utils/colors.dart';
import '../widgets/texts.dart';
import 'package:journal/utils/font_size.dart';

class WriteNote extends StatefulWidget {
  final VoidCallback onCancel;
  final VoidCallback saveNote;
  const WriteNote({super.key, required this.onCancel, required this.saveNote});

  @override
  State<WriteNote> createState() => _WriteNoteState();
}

class _WriteNoteState extends State<WriteNote> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.64,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                JakartaText(
                  text: 'NEW NOTE',
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize.subTitle,
                  color: AppColors.darkPink,
                ),
                const SizedBox(
                  height: 24,
                  child: VerticalDivider(
                    color: AppColors.lighterPink,
                    thickness: 1,
                    width: 20,
                  ),
                ),
                Expanded(child: SizedBox()),

                CancelButton(
                  onPressed: widget.onCancel,
                  icon: const Icon(Icons.cancel),
                  label: const Text('Cancel'),
                ),

                SizedBox(width: 7),

                Buttons(
                  onPressed: widget.saveNote,
                  icon: const Icon(Icons.save),
                  label: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.649,
          child: Divider(height: 20, color: Colors.grey, thickness: 0.2),
        ),

        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.64,
          height: MediaQuery.sizeOf(context).height * 0.08,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              maxLines: null,
              expands: true,
              decoration: const InputDecoration(
                hintStyle: TextStyle(
                  fontFamily: 'PlayFair',
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkPink,
                ),
                hintText: 'Name Your Beautiful Day',
                border: InputBorder.none,
              ),
            ),
          ),
        ),

        SizedBox(),
      ],
    );
  }
}
