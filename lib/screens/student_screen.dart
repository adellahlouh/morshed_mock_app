import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:morshed_mock_app/colors.dart';
import 'package:morshed_mock_app/models/std_model.dart';
import 'package:morshed_mock_app/widgets/interaction_bottom_sheet.dart';
import 'package:morshed_mock_app/widgets/tab_performance_widget.dart';
import 'package:morshed_mock_app/widgets/tab_info_widget.dart';
import 'package:morshed_mock_app/widgets/tab_schedule_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StudentInfoScreen extends StatefulWidget {
  final StdModel stdModel;

  const StudentInfoScreen({super.key, required this.stdModel});

  @override
  State<StudentInfoScreen> createState() => _StudentInfoScreenState();
}

class _StudentInfoScreenState extends State<StudentInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,

      floatingActionButton: Builder(
        builder: (context){
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton.extended(

              onPressed: () {
                showModalBottomSheet(context: context,
                    backgroundColor: Colors.white,

                    builder: (_){
                  return  InteractionBottomSheetWidget();
                },);
              },
              label:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('${AppLocalizations.of(context)!.interaction}', style: TextStyle(fontSize: 18),),
              ),
              icon: const Icon(Icons.add),
            ),
          );
        },
      ),

      body: SingleChildScrollView(
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
                        fontWeight: FontWeight.bold,
                      ),
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
                            'tel:${widget.stdModel.phoneNumber}',
                          );
                        },
                        icon: const Icon(
                          Icons.call,
                          color: AppColors.kPositive,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await launchUrl(Uri.parse(
                            'https://wa.me/${widget.stdModel.phoneNumber}',
                          ));
                        },
                        icon: const Icon(
                          FontAwesomeIcons.whatsapp,
                          color: AppColors.kPositive,
                        ),
                      ),
                    ],
                  ),
            TabInfoWidget(
              stdModel: widget.stdModel,
            ),
          ],
        ),
      ),
      // body: DefaultTabController(
      //   length: 3,
      //   child: Column(
      //     mainAxisSize: MainAxisSize.max,
      //     children: [
      //       Container(
      //         height: 64,
      //         width: 64,
      //         decoration: BoxDecoration(
      //           color: getRandomColor(),
      //           borderRadius: BorderRadius.circular(32),
      //         ),
      //         alignment: Alignment.center,
      //         child: Text(
      //           widget.stdModel.fullName.substring(0, 1).toUpperCase(),
      //           style: const TextStyle(
      //             color: Colors.white,
      //             fontSize: 32,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ),
      //       Text(
      //         widget.stdModel.fullName,
      //         style: const TextStyle(
      //           fontSize: 20,
      //           fontWeight: FontWeight.w600,
      //         ),
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           IconButton(
      //             splashColor: Colors.red,
      //             splashRadius: 32,
      //             onPressed: () async {
      //               await launchUrlString(
      //                 'tel:${widget.stdModel.phoneNumber}',
      //               );
      //             },
      //             icon: const Icon(
      //               Icons.call,
      //               color: AppColors.kPositive,
      //             ),
      //           ),
      //           IconButton(
      //             onPressed: () async {
      //               await launchUrl(Uri.parse(
      //                 'https://wa.me/${widget.stdModel.phoneNumber}',
      //               ));
      //             },
      //             icon: const Icon(
      //               FontAwesomeIcons.whatsapp,
      //               color: AppColors.kPositive,
      //             ),
      //           ),
      //         ],
      //       ),
      //       const Divider(),
      //       SizedBox(
      //         height: 50,
      //         child: AppBar(
      //           title: const SizedBox(),
      //           leading: const SizedBox(),
      //           bottom:  TabBar(
      //             tabs: [
      //               Tab(text: '${AppLocalizations.of(context)!.stdInfo}'),
      //               Tab(text: '${AppLocalizations.of(context)!.schedule}'),
      //               Tab(text: '${AppLocalizations.of(context)!.customTest}'),
      //             ],
      //           ),
      //         ),
      //       ),
      //       Expanded(
      //         child: TabBarView(
      //           children: [
      //             // Widgets for Tab 1
      //             SingleChildScrollView(
      //               child: TabInfoWidget(
      //                 stdModel: widget.stdModel,
      //               ),
      //             ),
      //
      //             const SingleChildScrollView(
      //               child: TabScheduleWidget(),
      //             ),
      //             // Widgets for Tab 2
      //             SingleChildScrollView(
      //               child: TabPerformanceWidget(),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
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
