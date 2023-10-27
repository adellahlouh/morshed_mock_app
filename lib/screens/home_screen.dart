import 'package:bouncing_button/bouncing_button.dart';
import 'package:flutter/material.dart';
import 'package:morshed_mock_app/colors.dart';
import 'package:morshed_mock_app/screens/crm_screen.dart';

import 'report_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Morshed',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: AppFonts.kFontFamily,
          ),
        ),
        centerTitle: true,
        elevation: 8,
        leading: const SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildItem(
              text: 'CRM',
              images: 'assets/images/crm.png',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return const CRMScreen();
                    },
                  ),
                );
              },
            ),
            _buildItem(
              text: 'Reports',
              images: 'assets/images/img.png',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ReportScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({
    required String text,
    required String images,
    required Function() onPressed,
  }) {
    return BouncingButton(
      onPressed: onPressed,
      scaleFactor: 0.2,
      duration: const Duration(milliseconds: 200),
      child: SizedBox(
        height: 200,
        child: Card(
          elevation: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                images,
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 16),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 24,
                  fontFamily: AppFonts.kFontFamily,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
