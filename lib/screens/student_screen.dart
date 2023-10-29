import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:morshed_mock_app/colors.dart';
import 'package:morshed_mock_app/std_model.dart';

class StudentInfoScreen extends StatelessWidget {
  final StdModel stdModel;
  const StudentInfoScreen({super.key, required this.stdModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.call,
                color: AppColors.kPrimaryColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.whatsapp,
                color: AppColors.kPositive,
              ),
            ),
          ],
        ),
      ),
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
              preferredSize: const Size.fromHeight(80),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundImage: NetworkImage(
                      'assets/images/anonymous_person.png',
                    ),
                  ),
                  Text(
                    stdModel.fullName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    stdModel.phoneNumber,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
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
                const SizedBox(height: 60.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
