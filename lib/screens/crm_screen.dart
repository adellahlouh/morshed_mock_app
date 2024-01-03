import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:morshed_mock_app/colors.dart';
import 'package:morshed_mock_app/constants.dart';
import 'package:morshed_mock_app/main.dart';
import 'package:morshed_mock_app/screens/notification_screen.dart';
import 'package:morshed_mock_app/screens/student_screen.dart';
import 'package:morshed_mock_app/screens/who_is_the_best_screen.dart';
import 'package:morshed_mock_app/models/std_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


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
        drawer: Drawer(
          child: ListView(
            children: [
              // Drawer Header - Welcome Message

               SizedBox(
                height: 50,
                child: Text(
                  '${AppLocalizations.of(context)!.welcomeMorshed} 👋',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title:  Text(
                  ' ${AppLocalizations.of(context)!.theBest} 🚀',
                  style: const TextStyle(
                    color: AppColors.kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppFonts.kFontFamily,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return const WhoIsTheBestScreen();
                      },
                    ),
                  );
                },
              ),

              // Settings Tile
              ListTile(
                title: Text(
                  '${AppLocalizations.of(context)!.settings}',
                  style: buildTextStyle,
                ),
                onTap: () {},
              ),

              // About Tile
              ListTile(
                title: Text(
                  '${AppLocalizations.of(context)!.about}',
                  style: buildTextStyle,
                ),
                onTap: () {},
              ),

              // Language Tile
              ListTile(
                title: Text(
                  '${AppLocalizations.of(context)!.language}',
                  style: buildTextStyle,
                ),
                onTap: () {
                  localValue.value = localValue.value.languageCode =='ar' ? const Locale('en') : const Locale('ar');
                },
              ),

              // Logout
              ListTile(
                title: Text(
                  '${AppLocalizations.of(context)!.logout}',
                  style: buildTextStyle,
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title:  Text('${AppLocalizations.of(context)!.homeScreen} '),
          centerTitle: true,
          elevation: 8,
          leading: Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                ),
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return NotificationScreen();
                    },
                  ),
                );
              },
              icon: const Icon(
                FontAwesomeIcons.bell,
              ),
            ),
          ],
          bottom:  TabBar(
            labelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            tabs: [
              Tab(
                text: '${AppLocalizations.of(context)!.allContacts}',
              ),
              Tab(
                text: '${AppLocalizations.of(context)!.onBoarding}',
              ),
              Tab(
                text: '${AppLocalizations.of(context)!.followUp}',
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

  TextStyle get buildTextStyle {
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: AppFonts.kFontFamily,
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
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: SearchBar(
            hintText: '${AppLocalizations.of(context)!.search}',
            onChanged: (v)=>{},
            trailing: [
              const Icon(Icons.search),
              const SizedBox(width: 10),
            ],
            elevation: MaterialStateProperty.all<double>(1),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.white,
            ),
            shadowColor: MaterialStateProperty.all<Color>(
              Colors.grey,
            ),
          ),
        ),

        Expanded(
          child: ListView.builder(
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
                              '${AppLocalizations.of(context)!.stdName} : ${model.fullName}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500,),
                            ),
                            Text('${AppLocalizations.of(context)!.stdId} : ${Random().nextInt(100000)}'),
                            const SizedBox(height: 8.0),

                            Text('${AppLocalizations.of(context)!.stdPhone} : ${model.phoneNumber}'),


                            const SizedBox(height: 8.0),
                            Text(
                              '${AppLocalizations.of(context)!.lastActiveDate} : ${DateFormat.yMEd(localValue.value.languageCode).format(model.lastActiveDate)}',
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '${AppLocalizations.of(context)!.lastSuccessContactDate} : ${DateFormat.yMEd(localValue.value.languageCode).format(model.lastDateCalled)}',
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '${AppLocalizations.of(context)!.onBoardingDate} : ${DateFormat.yMEd(localValue.value.languageCode).format(model.lastDateCalled)}',
                            ),

                            const SizedBox(height: 12.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () async {
                                    await launchUrlString('tel:${model.phoneNumber}');
                                  },
                                  icon: const Icon(
                                    Icons.call,
                                    color: AppColors.kPositive,
                                  ),
                                  label:  Text(
                                    '${AppLocalizations.of(context)!.call}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () async {
                                    await launchUrl(Uri.parse(
                                      'https://wa.me/${model.phoneNumber}',
                                    ));
                                  },
                                  icon: const Icon(
                                    FontAwesomeIcons.whatsapp,
                                    color: AppColors.kPositive,
                                  ),
                                  label:  Text(
                                    '${AppLocalizations.of(context)!.whatsapp}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
