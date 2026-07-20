import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/write_note.dart';
import 'widgets/texts.dart';
import 'widgets/buttons.dart';
import 'widgets/journal_card.dart';
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

  String? render;

  final List<Map<String, dynamic>> journalEntries = [
    {
      'title': 'My First Journal Entry',
      'content': 'This is the content of my first journal entry.',
      'category': 'Personal',
      'mood': 'Joyful',
      'date': '07/15/2023',
      'time': '10:30 AM',
      'isStarred': true,
    },
    {
      'title': 'A Calm Day',
      'content': 'Today was a calm and peaceful day.',
      'category': 'Reflection',
      'mood': 'Calm',
      'date': '07/16/2023',
      'time': '02:15 PM',
      'isStarred': false,
    },
    {
      'title': 'Gratitude Journal',
      'content': 'I am grateful for the little things in life.',
      'category': 'Gratitude',
      'mood': 'Grateful',
      'date': '07/17/2023',
      'time': '04:00 PM',
      'isStarred': true,
    },
  ];

  final List<String> moods = [
    'All Moods',
    'Joyful',
    'Calm',
    'Grateful',
    'Unsettled',
    'Gentle',
    'Radiant',
  ];
  String _selectedMood = 'All Moods';
  bool isStarred = false;
  bool isSelected = false;
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

  void writeNote() {
    setState(() {
      render = 'writeNote';
    });
  }

  void cancelWriteNote() {
    setState(() {
      render = null;
    });
  }

  Widget _renderRightContent() {
    switch (render) {
      case 'writeNote':
        return WriteNote(onCancel: cancelWriteNote, saveNote: () {});

      case 'displayNote':
        return SizedBox();

      case 'editNote':
        return SizedBox();
      default:
        return HomeScreen(onWriteNote: writeNote);
    }
  }

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
            onPressed: writeNote,
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
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        child: Column(
                          children: [
                            const SizedBox(height: 10),

                            SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: JakartaText(
                                  text: 'Categories',
                                  fontSize: FontSize.subTitle,
                                  color: AppColors.darkPink,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                                    final isSelected =
                                        _selectedCategory == category;
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
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: OutlinedButton.icon(
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
                                    ),

                                    Row(
                                      children: [
                                        const JakartaText(
                                          text: 'Moods:',
                                          fontSize: FontSize.texts,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.darkPink,
                                        ),

                                        SizedBox(width: 8),

                                        SizedBox(
                                          width: 120,
                                          height: 30,
                                          child: DropdownButtonFormField(
                                            initialValue: _selectedMood,
                                            icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: AppColors.pink,
                                            ),
                                            elevation: 16,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: FontSize.texts,
                                              fontFamily: 'PlusJakartaSans',
                                              color: AppColors.pink,
                                            ),

                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                  color: AppColors.darkPink,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                  color: AppColors.pink,
                                                ),
                                              ),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                    horizontal: 7,
                                                    vertical: 3,
                                                  ),
                                            ),

                                            onChanged: (String? value) {
                                              // This is called when the user selects an item.
                                              setState(() {
                                                _selectedMood = value!;
                                                debugPrint(_selectedMood);
                                              });
                                            },
                                            items: moods.map((String value) {
                                              return DropdownMenuItem(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),
                                        ),

                                        SizedBox(width: 8),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: journalEntries.length,
                      itemBuilder: (context, index) {
                        return JournalCard(
                          title: journalEntries[index]['title'],
                          content: journalEntries[index]['content'],
                          category: journalEntries[index]['category'],
                          mood: journalEntries[index]['mood'],
                          onPressed: () {},
                          onDelete: () {},
                          onBookmarked: () {},
                        );
                      },
                    ),
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

          _renderRightContent(),
        ],
      ),
    );
  }
}
