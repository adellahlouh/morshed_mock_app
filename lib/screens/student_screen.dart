import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:morshed_mock_app/colors.dart';
import 'package:morshed_mock_app/models/std_model.dart';
import 'package:morshed_mock_app/widgets/checkbox_list_widget.dart';
import 'package:morshed_mock_app/widgets/circular_progress_indicator.dart';
import 'package:morshed_mock_app/widgets/note_widget.dart';
import 'package:morshed_mock_app/widgets/subject_list_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class StudentInfoScreen extends StatefulWidget {
  final StdModel stdModel;

  StudentInfoScreen({super.key, required this.stdModel});

  @override
  State<StudentInfoScreen> createState() => _StudentInfoScreenState();
}

class _StudentInfoScreenState extends State<StudentInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: true,
            floating: true,
            title: const Text(
              'Student Info',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            expandedHeight: 200,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(120),
              child: Column(
                children: [
                  Container(
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                      color: getRandomColor(),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      widget.stdModel.fullName.substring(0, 1).toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    widget.stdModel.fullName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        splashColor: Colors.red,
                        splashRadius: 32,
                        onPressed: () async {
                          await launchUrlString(
                              'tel:${widget.stdModel.phoneNumber}');
                        },
                        icon: const Icon(
                          Icons.call,
                          color: AppColors.kPositive,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await launchUrl(Uri.parse(
                              'https://wa.me/${widget.stdModel.phoneNumber}'));
                        },
                        icon: const Icon(
                          FontAwesomeIcons.whatsapp,
                          color: AppColors.kPositive,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await launchUrlString(
                              'sms:${widget.stdModel.phoneNumber}');
                        },
                        icon: const Icon(
                          FontAwesomeIcons.commentSms,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  const TabBar(
                    tabs: [
                      Tab(text: 'Student Info'),
                      Tab(text: 'Schedule'),
                      Tab(text: 'Performance'),
                    ],
                  ),
                  SizedBox(
                    height: 400.0, // Height for TabBarView
                    child: TabBarView(
                      children: [
                        // Widgets for Tab 1
                        SingleChildScrollView(
                          child: TabInfoWidget(
                            stdModel: widget.stdModel,
                          ),
                        ),

                        const SingleChildScrollView(child: TabScheduleWidget()),
                        // Widgets for Tab 2
                        CheckBoxListWidget(),
                      ],
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

  Color getRandomColor() {
    final Random random = Random();
    return tenColors[random.nextInt(tenColors.length)];
  }

  List<Color> tenColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.black54,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.cyan,
    Colors.indigo,
  ];
}

class TabInfoWidget extends StatelessWidget {
  final StdModel stdModel;

  const TabInfoWidget({super.key, required this.stdModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.kSecondaryBlueColor,
          ),
          child: ListTile(
            title: const Text(
              'Email',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(stdModel.email),
          ),
        ),
        ListTile(
          title: const Text(
            'Last Contacted',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            DateFormat.yMMMd().format(stdModel.lastContacted),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.kSecondaryBlueColor,
          ),
          child: ListTile(
            title: const Text(
              'Top Subject',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(stdModel.topSubject),
          ),
        ),
        ListTile(
          title: const Text(
            'Worst Subject',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(stdModel.worstSubject),
        ),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.kSecondaryBlueColor,
          ),
          child: ListTile(
            title: const Text(
              'Last Active Date',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              DateFormat.yMMMd().format(stdModel.lastActiveDate),
            ),
          ),
        ),
        ListTile(
          title: const Text(
            'Last Call Date',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            DateFormat.yMMMd().format(stdModel.lastDateCalled),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.kSecondaryBlueColor,
          ),
          child: ListTile(
            title: const Text(
              'Program',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(stdModel.programName),
          ),
        ),
        ListTile(
          title: const Text(
            'Call Status',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            stdModel.callStatus.name.toUpperCase(),
            style: TextStyle(
              color: stdModel.callStatus.color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        NotePage(),
        const SizedBox(height: 60.0),
      ],
    );
  }
}

class TabScheduleWidget extends StatelessWidget {
  const TabScheduleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          child: Container(
            height: 120,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color:  AppColors.kPrimaryColor,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFbfd3ff),
                  spreadRadius: 3,
                  blurRadius: 8,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: RichText(
                    text:  TextSpan(
                      text: 'The student has completed',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: ' 80% ',
                          style: TextStyle(
                            color: getColorFromPercentage(0.8),
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Dubai',
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,

                          ),
                        ),
                        const TextSpan(
                          text: 'of his schedule.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Dubai',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CircularPercentIndicator(
                  radius: 60,
                  lineWidth: 5.0,
                  percent: 0.8,
                  center: const Text(
                    '80%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  progressColor: getColorFromPercentage(0.8),
                ),
              ],
            ),
          ),
        ),
        SubjectListWidget(),
      ],
    );
  }
  Color getColorFromPercentage(double percentage) {
    if (percentage < 0.5) {
      return const Color(0xffEF4444);
    } else if (percentage >= 0.5 && percentage < 0.7) {
      return const Color(0xffFB923C);
    } else {
      return const Color(0xff22C55E);
    }
  }

}
