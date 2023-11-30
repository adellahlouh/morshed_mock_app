import 'package:flutter/material.dart';
import 'package:morshed_mock_app/colors.dart';
import 'package:morshed_mock_app/widgets/subject_list_widget.dart';

import 'circular_progress_indicator.dart';

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
              color: AppColors.kPrimaryColor,
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
                    text: TextSpan(
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
