import 'package:flutter/material.dart';
import 'package:morshed_mock_app/constants.dart';
import 'package:morshed_mock_app/std_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Morshed '),
          centerTitle: true,
          elevation: 8,
          leading: const SizedBox(),
          ),
      body: ListView.builder(
          itemCount: stdMap.length,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            final model = StdModel.fromJson(stdMap[index]);
            return Padding(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.call,
                                color: Colors.green,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.message,
                                color: Colors.blue,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
