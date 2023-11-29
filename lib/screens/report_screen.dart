import 'package:flutter/material.dart';
import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:intl/intl.dart';
import 'package:morshed_mock_app/colors.dart';
import 'package:morshed_mock_app/screens/student_screen.dart';
import 'package:morshed_mock_app/std_model.dart';

import '../constants.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Reports',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          elevation: 8,
          bottom: const TabBar(
            labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            tabs: [
              Tab(
                text: 'All calls',
              ),
              Tab(
                text: 'Successful calls',
              ),
              Tab(
                text: 'Pending calls',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ReportWidget(),
            ReportWidget(callStatus: CallStatus.success),
            ReportWidget(callStatus: CallStatus.pending),
          ],
        ),
      ),
    );
  }
}

class ReportWidget extends StatelessWidget {
  final CallStatus? callStatus;
  const ReportWidget({super.key, this.callStatus});

  @override
  Widget build(BuildContext context) {
    final studentList = callStatus == null
        ? stdModelList
        : stdModelList
            .where(
              (e) => e.callStatus == callStatus,
            )
            .toList();
    return ListView.builder(
      itemCount: studentList.length,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        final model = studentList[index];

        return StudentCardWidget(model: model);
      },
    );
  }
}

class StudentCardWidget extends StatelessWidget {
  const StudentCardWidget({
    super.key,
    required this.model,
  });

  final StdModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return StudentInfoScreen(stdModel: model);
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const Text(
                      'Name : ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      model.fullName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Email : ${model.email}',
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Phone number : ${model.phoneNumber}',
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Program : ${model.programName}',
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Last Active Date : ${DateFormat.yMEd().format(model.lastActiveDate)}',
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Last Call Date : ${DateFormat.yMEd().format(model.lastDateCalled)}',
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    const Text(
                      'Call Status : ',
                    ),
                    Text(
                      model.callStatus.name.toUpperCase(),
                      style: TextStyle(
                        color: model.callStatus.color,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFonts.kFontFamily,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.call,
                        color: AppColors.kPositive,
                      ),
                      label: const Text(
                        'Call',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.message,
                        color: AppColors.kPrimaryColor,
                      ),
                      label: const Text(
                        'Message',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FlexibleSpaceButtons extends StatelessWidget
    implements PreferredSizeWidget {
  const FlexibleSpaceButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedButtonBar(
      radius: 8.0,
      padding: const EdgeInsets.all(16.0),
      invertedSelection: true,
      children: [
        ButtonBarEntry(
          onTap: () => debugPrint('First item tapped'),
          child: const Text('All calls'),
        ),
        ButtonBarEntry(
          onTap: () => debugPrint('Second item tapped'),
          child: const Text('Successful calls'),
        ),
        ButtonBarEntry(
          onTap: () => debugPrint('Third item tapped'),
          child: const Text('Pending calls'),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
