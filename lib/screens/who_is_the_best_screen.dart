import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:morshed_mock_app/colors.dart';
import 'package:morshed_mock_app/models/std_model.dart';
import 'package:morshed_mock_app/screens/student_screen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../constants.dart';
import 'congrats_template_screen.dart';

class WhoIsTheBestScreen extends StatefulWidget {
  const WhoIsTheBestScreen({Key? key}) : super(key: key);

  @override
  _WhoIsTheBestScreenState createState() => _WhoIsTheBestScreenState();
}

class _WhoIsTheBestScreenState extends State<WhoIsTheBestScreen> {
  List<StdModel> filteredList = [];
  bool isLoading = false;

  void onSearch(String query) {
    // Filter the list based on the search query
    setState(() {
      filteredList = stdModelList
          .where((model) =>
              model.fullName.toLowerCase().contains(query.toLowerCase()) ||
              model.email.toLowerCase().contains(query.toLowerCase()) ||
              model.phoneNumber.toLowerCase().contains(query.toLowerCase()) ||
              model.programName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Who is the best?'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: SearchBar(
                    hintText: 'Search',
                    onChanged: onSearch,
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
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredList.isNotEmpty
                      ? filteredList.length
                      : stdModelList.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    final model = filteredList.isNotEmpty
                        ? filteredList[index]
                        : stdModelList[index];
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
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text('Email : ${model.email}'),
                                Text('Phone number : ${model.phoneNumber}'),
                                Text('Program : ${model.programName}'),
                                const SizedBox(height: 8.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () async {
                                        await launchUrlString(
                                            'tel:${model.phoneNumber}',);
                                      },
                                      icon: const Icon(
                                        Icons.call,
                                        color: AppColors.kPositive,
                                      ),
                                      label: const Text(
                                        '',
                                        style: TextStyle(
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
                                      label: const Text(
                                        '',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        // showAlertDialog(context, model);
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return CongratsTemplateScreen(model: model);
                                            },
                                          ),
                                        );

                                      },
                                      icon: const Text('🎉' , style: TextStyle(fontSize: 16),),
                                      label: const Text(
                                        'Congrats',
                                        style: TextStyle(
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
                  },
                ),
              ],
            ),
    );
  }

  showAlertDialog(BuildContext context, StdModel model) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Congrats'),
          content: const Text('Are you sure you want to send Congrats?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                // navigate to congrats template screen CongratsTemplateScreen

                Navigator.of(context).pop();


                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return CongratsTemplateScreen(model: model);
                    },
                  ),
                );



              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
