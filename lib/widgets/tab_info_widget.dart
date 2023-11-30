import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:morshed_mock_app/colors.dart';
import 'package:morshed_mock_app/models/std_model.dart';
import 'package:morshed_mock_app/widgets/note_widget.dart';

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
