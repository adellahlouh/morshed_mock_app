import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:morshed_mock_app/colors.dart';
import 'package:morshed_mock_app/constants.dart';
import 'package:morshed_mock_app/screens/student_screen.dart';
import 'package:morshed_mock_app/std_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CRMScreen extends StatefulWidget {
  const CRMScreen({super.key});

  @override
  State<CRMScreen> createState() => _CRMScreenState();
}

class _CRMScreenState extends State<CRMScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen '),
          centerTitle: true,
          elevation: 8,
          leading: const SizedBox(),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.bell,
              ),
            )
          ],
          bottom: const TabBar(
            labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            tabs: [
              Tab(
                text: 'All Contacts',
              ),
              Tab(
                text: 'Onboarding',
              ),
              Tab(
                text: 'Follow up',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _CRMWidget(
              onboardingStatus: OnboardingStatus.all,
            ),
            _CRMWidget(
              onboardingStatus: OnboardingStatus.onboard,
            ),
            _CRMWidget(
              onboardingStatus: OnboardingStatus.followup,
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class _CRMWidget extends StatefulWidget {
  final OnboardingStatus onboardingStatus;

  const _CRMWidget({required this.onboardingStatus});

  @override
  State<_CRMWidget> createState() => _CRMWidgetState();
}

class _CRMWidgetState extends State<_CRMWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemCount: stdModelList.length,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        final model = stdModelList[index];
        if (model.onboardingStatus == widget.onboardingStatus ||
            widget.onboardingStatus == OnboardingStatus.all) {
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
                    children: [
                      Text(
                        'Name : ${model.fullName}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text('Email : ${model.email}'),
                      Text('Phone number : ${model.phoneNumber}'),
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
                              fontSize: 15
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () async{
                              await launchUrlString('tel:${model.phoneNumber}');

                            },
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
                              FontAwesomeIcons.whatsapp,
                              color: AppColors.kPositive,
                            ),
                            label: const Text(
                              'Whatsapp',
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

        return const SizedBox();
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
