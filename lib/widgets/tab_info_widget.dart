import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:morshed_mock_app/colors.dart';
import 'package:morshed_mock_app/main.dart';
import 'package:morshed_mock_app/models/std_model.dart';
import 'package:morshed_mock_app/widgets/note_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TabInfoWidget extends StatelessWidget {
  final StdModel stdModel;

   TabInfoWidget({super.key, required this.stdModel});

  final list = ['Parent' , 'Student'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.kSecondaryBlueColor,
          ),
          child: ListTile(
            title:  Text(
              '${AppLocalizations.of(context)!.stdName}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(stdModel.fullName),
          ),
        ),
        ListTile(
          title:  Text(
            '${AppLocalizations.of(context)!.stdId}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text('${Random().nextInt(1000)}'),
        ),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.kSecondaryBlueColor,
          ),
          child: ListTile(
            title:  Text(
              '${AppLocalizations.of(context)!.stdPhone}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(stdModel.phoneNumber),
          ),
        ),
         ListTile(
          title: Text(
            '${AppLocalizations.of(context)!.stdParentNumber}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle:  const Text('+962789461941'),
        ),
        ListTile(
          title:  Text(
            '${AppLocalizations.of(context)!.lastActiveDate}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(DateFormat.yMMMd(localValue.value.languageCode).format(stdModel.lastActiveDate)),
        ),

        Container(
          decoration: const BoxDecoration(
            color: AppColors.kSecondaryBlueColor,
          ),

          child: ListTile(
            title:  Text(
              '${AppLocalizations.of(context)!.lastSuccessContactDate}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              DateFormat.yMMMd(localValue.value.languageCode).format(stdModel.lastActiveDate),
            ),
          ),
        ),
        ListTile(
          title:  Text(
            '${AppLocalizations.of(context)!.lastCallType}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text('${list[Random().nextInt(2)]}'),
        ),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.kSecondaryBlueColor,
          ),
          child: ListTile(
            title:  Text(
              '${AppLocalizations.of(context)!.bestSubject}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text('${stdModel.topSubject} (Score: 90%)'),
          ),
        ),
        ListTile(
          title:  Text(
            '${AppLocalizations.of(context)!.worstSubject}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text('${stdModel.worstSubject} (Score: 20%)'),
        ),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.kSecondaryBlueColor,
          ),
          child: ListTile(
            title:  Text(
              '${AppLocalizations.of(context)!.onBoardingDate}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              DateFormat.yMMMd(localValue.value.languageCode).format(stdModel.lastActiveDate),
            ),
          ),
        ),
         ListTile(
          title: Text(
            '${AppLocalizations.of(context)!.reportCardLink}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text(
            'https://www.abwwab.com/report/card',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),

        NotePage(),
        const SizedBox(height: 60.0),
      ],
    );
  }
}
String convertToArabicNumber(String number) {
  String res = '';

  final arabics = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
  number.characters.forEach((element) {
    res += arabics[int.parse(element)];
  });

/*   final latins = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']; */
  return res;
}