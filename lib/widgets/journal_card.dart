import 'package:flutter/material.dart';
import 'package:journal/utils/colors.dart';
import 'texts.dart';

class JournalCard extends StatefulWidget {
  final String title;
  final String content;
  final String category;
  final String mood;
  final void Function()? onPressed;
  final void Function()? onDelete;
  final void Function()? onBookmarked;
  const JournalCard({
    super.key,
    required this.title,
    required this.content,
    required this.category,
    required this.mood,
    this.onPressed,
    this.onBookmarked,
    this.onDelete,
  });

  @override
  State<JournalCard> createState() => _JournalCardState();
}

class _JournalCardState extends State<JournalCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.pink, width: 0.2),
      ),
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: widget.onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // date badge + time/location + icons
                children: [
                  // _DateBadge(month: 'JUL', day: '18'),
                  const SizedBox(width: 12),

                  // Location
                  Expanded(child: Text('Location')),
                  IconButton(
                    icon: Icon(Icons.bookmark_border),
                    onPressed: widget.onBookmarked,
                  ),
                  IconButton(
                    icon: Icon(Icons.delete_outline),
                    onPressed: widget.onDelete,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              PlayFairText(
                text: widget.title,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 6),
              JakartaText(
                text: widget.content,
                fontSize: 14,
                color: Colors.grey.shade600,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Row(
                // tags + hearts
                children: [
                  // Mood
                  Chip(label: Text('${widget.mood}')),
                  const SizedBox(width: 8),
                  // Category
                  Chip(label: Text('${widget.category}')),
                  const Spacer(),
                  Row(
                    children: List.generate(
                      5,
                      (_) => Icon(Icons.favorite, size: 16, color: Colors.pink),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
