import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:morshed_mock_app/constants.dart';
import 'package:morshed_mock_app/std_model.dart';

class CRMScreen extends StatefulWidget {
  const CRMScreen({super.key});

  @override
  State<CRMScreen> createState() => _CRMScreenState();
}

class _CRMScreenState extends State<CRMScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CRM Screen '),
          centerTitle: true,
          elevation: 8,
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

class _CRMWidget extends StatefulWidget  {
  final OnboardingStatus onboardingStatus;

  const _CRMWidget({required this.onboardingStatus});

  @override
  State<_CRMWidget> createState() => _CRMWidgetState();
}

class _CRMWidgetState extends State<_CRMWidget> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      itemCount: stdModelList.length,
      shrinkWrap: true,
      itemBuilder: (_, index) {

        final model = stdModelList[index];
        if(model.onboardingStatus == widget.onboardingStatus || widget.onboardingStatus == OnboardingStatus.all) {
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
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.message,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  )
                ],
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
