import 'package:flutter/material.dart';
import 'widgets/texts.dart';
import 'widgets/buttons.dart';
import 'utils/font_size.dart';
import 'utils/colors.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: const MyJournal()),
  );
}

class MyJournal extends StatefulWidget {
  const MyJournal({super.key});

  @override
  State<MyJournal> createState() => _MyJournalState();
}

class _MyJournalState extends State<MyJournal> {
  // VARIABLES

  // bool switchState = false;
  bool isStarred = false;
  final ScrollController _scrollController = ScrollController();
  String _selectedCategory = 'All';
  final List<String> _categories = [
    'All',
    'Personal',
    'Health',
    'Reflection',
    'Travel',
    'Ideas',
    'Gratitude',
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leadingWidth: 85,
        leading: const Padding(
          padding: EdgeInsetsGeometry.only(left: 25, top: 3, bottom: 3),
          // padding: EdgeInsetsGeometry.only(left: 25),
          child: Card(
            elevation: 2,
            color: AppColors.transparentPink,
            borderOnForeground: true,
            child: Icon(Icons.favorite, color: AppColors.darkPink),
          ),
        ),

        title: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlayFairText(
              text: "Jijel's Journal",
              fontSize: FontSize.subTitle,
              fontWeight: FontWeight.bold,
            ),

            JakartaText(
              text: 'COZY DIARY SPACE',
              fontSize: FontSize.texts,
              color: AppColors.pink,
            ),
          ],
        ),
        actions: [
          Buttons(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Write Note'),
          ),

          const SizedBox(
            height: 24,
            child: VerticalDivider(
              color: AppColors.lighterPink,
              thickness: 1,
              width: 20,
            ),
          ),

          const SizedBox(
            height: 40,
            width: 40,
            child: Card(child: Icon(Icons.person)),
          ),
          const Padding(
            padding: EdgeInsetsGeometry.only(right: 25),
            child: Text('User'),
          ),
        ],

        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(height: 1, thickness: 0.2, color: Colors.grey),
        ),
      ),

      body: Row(
        children: [
          // Left side
          Container(
            color: AppColors.transparentPink,
            width: MediaQuery.sizeOf(context).width * 0.35,
            height: double.infinity,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 200,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),

                      JakartaText(
                        text: 'Categories',
                        fontSize: FontSize.subTitle,
                        color: AppColors.darkPink,
                        fontWeight: FontWeight.bold,
                      ),

                      const SizedBox(height: 10),

                      Scrollbar(
                        controller: _scrollController,
                        thumbVisibility: true,
                        child: SizedBox(
                          height: 60,
                          child: ListView(
                            controller: _scrollController,
                            padding: EdgeInsets.only(bottom: 12),
                            scrollDirection: Axis.horizontal,
                            children: _categories.map((category) {
                              final isSelected = _selectedCategory == category;
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4.0,
                                ),
                                child: ChoiceChip(
                                  label: Text(category),
                                  selected: isSelected,
                                  onSelected: (selected) {
                                    setState(() {
                                      _selectedCategory = category;
                                    });
                                  },
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),

                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: !isStarred
                                    ? Colors.white
                                    : AppColors.transparentPink,
                                side: const BorderSide(
                                  width: 1.0,
                                  color: AppColors.darkPink,
                                ),
                              ),

                              onPressed: () {
                                setState(() {
                                  isStarred = !isStarred;
                                  debugPrint('$isStarred');
                                });
                              },

                              label: const JakartaText(
                                text: 'Starred',
                                fontSize: FontSize.texts,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkPink,
                              ),

                              icon: !isStarred
                                  ? const Icon(
                                      Icons.bookmark_border,
                                      color: AppColors.darkPink,
                                    )
                                  : const Icon(
                                      Icons.bookmark,
                                      color: AppColors.darkPink,
                                    ),
                            ),

                            Row(
                              children: [
                                const JakartaText(
                                  text: 'Moods:',
                                  fontSize: FontSize.texts,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.darkPink,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: double.infinity,
            child: VerticalDivider(
              color: Colors.grey,
              thickness: 0.2,
              width: 1,
            ),
          ),

          // Right side
          SizedBox(
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
                      onPressed: () {},
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
          ),
        ],
      ),
    );
  }
}