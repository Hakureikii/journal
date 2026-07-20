import 'package:flutter/material.dart';
import '../widgets/buttons.dart';

class WriteNote extends StatefulWidget {
  final VoidCallback onCancel;
  const WriteNote({super.key, required this.onCancel});

  @override
  State<WriteNote> createState() => _WriteNoteState();
}

class _WriteNoteState extends State<WriteNote> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Write Note Screen'),
            Buttons(
              onPressed: widget.onCancel,
              icon: Icon(Icons.cancel),
              label: Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
