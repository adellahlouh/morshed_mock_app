import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:morshed_mock_app/colors.dart';
import 'package:morshed_mock_app/core/helpers/debouncer.dart';

class TabPerformanceWidget extends StatefulWidget {
  TabPerformanceWidget({super.key});

  @override
  State<TabPerformanceWidget> createState() => _TabPerformanceWidgetState();
}

class _TabPerformanceWidgetState extends State<TabPerformanceWidget> {
  final List<String> categories = [
    'Math',
    'Physics',
    'Chemistry',
    'English',
  ];

  final String link = 'https://dl.abwaab.com/YNvF';

  bool isLoading = false ;

  // Replace this with your link
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: categories.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(categories[index]),
              children: [
                CheckboxListTile(
                  title: const Text('Lesson 1'),
                  value: false, // Initial value of the checkbox
                  onChanged: (bool? value) => {
                    // Handle checkbox state change
                  },
                ),
                CheckboxListTile(
                  title: const Text('Lesson 2'),
                  value: false,
                  onChanged: (bool? value) => {
                    // Handle checkbox state change
                  },
                ),
                CheckboxListTile(
                  title: const Text('Lesson 3'),
                  value: false,
                  onChanged: (bool? value) => {
                    // Handle checkbox state change
                  },
                ),
                CheckboxListTile(
                  title: const Text('Lesson 4'),
                  value: false,
                  onChanged: (bool? value) => {
                    // Handle checkbox state change
                  },
                ),
              ],
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            minWidth: double.infinity,
            color: AppColors.kPrimaryColor,
            onPressed: () {
              setState(() {
                isLoading = true ;
              });
              Future.delayed(const Duration(seconds: 2))
                  .then((value) {
                setState(() {
                  isLoading = false ;
                });
                    return showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Custom test deep link'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  link,
                                  style: const TextStyle(
                                    color: AppColors.kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () => _copyLink(context),
                                  child: const Text('Copy Link'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                  });
            },
            child: isLoading ? getCenterCircularProgress(
              color: Colors.white,
              size: 24.0,
            ) : const Text(
              'Create custom test',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _copyLink(BuildContext context) {
    Navigator.pop(context);
    Clipboard.setData(ClipboardData(text: link));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Link copied to clipboard'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
