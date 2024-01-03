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
  final Map<String, List<String>> categories = {
    'Math': ['Algebra', 'Geometry', 'Calculus', 'Number Theory'],
    'Physics': [
      'Classical Mechanics',
      'Thermodynamics',
      'Electromagnetism',
      'Optics',
      'Fluid Mechanics'
    ],
    'Chemistry': [
      'General Chemistry',
      'Organic Chemistry',
      'Inorganic Chemistry',
      'Physical Chemistry'
    ],
    'English': ['Verb', 'Adjective', 'Adverb'],
  };

  final String link = 'https://dl.abwaab.com/YNvF';

  bool isLoading = false;

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
            final List<String> keys = categories.keys.toList();

            return ExpansionTile(
              title: Text(keys[index]),
              children: categories[keys[index]]!
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CheckboxListTile(
                        title:  Text('${e.toString()}'),
                        value: false, // Initial value of the checkbox
                        onChanged: (bool? value) => {
                          // Handle checkbox state change
                        },
                      ),
                    ),
                  )
                  .toList(),
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
                isLoading = true;
              });
              Future.delayed(const Duration(seconds: 2)).then((value) {
                setState(() {
                  isLoading = false;
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
            child: isLoading
                ? getCenterCircularProgress(
                    color: Colors.white,
                    size: 24.0,
                  )
                : const Text(
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
