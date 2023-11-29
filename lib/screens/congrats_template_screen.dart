import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/std_model.dart';
import 'video_player_screen.dart';

class CongratsTemplateScreen extends StatefulWidget {
  final StdModel model;
  const CongratsTemplateScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<CongratsTemplateScreen> createState() => _CongratsTemplateScreenState();
}

class _CongratsTemplateScreenState extends State<CongratsTemplateScreen> {
  final List<String> gifAssets = [
    'assets/images/gif_one.gif',
    'assets/images/gif_two.gif',
    'assets/images/gif_three.gif',
    'assets/images/gif_one.gif',
    'assets/images/gif_two.gif',
    'assets/images/gif_three.gif',
    'assets/images/gif_one.gif',
    'assets/images/gif_two.gif',
    'assets/images/gif_three.gif',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Congrats Templates')),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: gifAssets.length,
        itemBuilder: (context, index) {
          return GridTile(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(gifAssets[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Handle send button click
                    // You can add logic here to send the GIF
                    // For now, it just prints a message

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoPlayerScreen(model: widget.model),
                      ),
                    );
                  },
                  child: const Text('Choose'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void sendVideo() async {
    const link =
        'https://drive.google.com/file/d/19XQ1hL3AHbxgBkBJ0d9akcs8krQ2pEj0/view?usp=sharing';

    final message =
        'Congrats ${widget.model.fullName} for your success. You are the best.'
        '\n\n'
        'Video Link: $link';

    await launchUrl(
        Uri.parse('https://wa.me/${widget.model.phoneNumber}?text=$message'));
  }
}
