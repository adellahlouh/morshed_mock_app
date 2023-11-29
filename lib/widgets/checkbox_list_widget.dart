import 'package:flutter/material.dart';

class CheckBoxListWidget extends StatelessWidget {
   CheckBoxListWidget({super.key});

  final List<String> categories = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text(categories[index]),
          children: [
            CheckboxListTile(
              title: const Text('Item 1'),
              value: false, // Initial value of the checkbox
              onChanged: (bool? value) {
                // Handle checkbox state change
                print('Checkbox in Category $index is ${value == true ? 'checked' : 'unchecked'}');
              },
            ),
            CheckboxListTile(
              title: const Text('Item 2'),
              value: false,
              onChanged: (bool? value) {
                // Handle checkbox state change
                print('Checkbox in Category $index is ${value == true ? 'checked' : 'unchecked'}');
              },
            ),
            // Add more CheckboxListTile widgets as needed
          ],
        );
      },
    );
  }
}
