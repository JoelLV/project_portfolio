import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const _TitleSection(),
            const SizedBox(
              height: 70,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: const _MainResourceButtons(),
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection();

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: MediaQuery.of(context).size.width >= 800
          ? Axis.horizontal
          : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(300),
          child: Image.asset(
            'assets/images/profile_picture.jpg',
            alignment: Alignment.center,
            width: 250,
            height: 250,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 40,
        ),
        Column(
          crossAxisAlignment: MediaQuery.of(context).size.width >= 800
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            Text(
              'Hi, I\'m Joel.',
              style: TextStyle(
                letterSpacing: 2,
                color: Theme.of(context).primaryColor,
                fontSize: 45,
                fontWeight: FontWeight.w600,
                shadows: const [
                  Shadow(
                    color: Colors.black26,
                    offset: Offset(0, 3),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
            Text(
              'A CS Student at SAU',
              style: TextStyle(
                letterSpacing: 2,
                color: Theme.of(context).primaryColor.withOpacity(.44),
                fontSize: 25,
                fontWeight: FontWeight.w600,
                shadows: const [
                  Shadow(
                    color: Color.fromARGB(66, 69, 69, 69),
                    offset: Offset(0, 3),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MainResourceButtons extends StatelessWidget {
  const _MainResourceButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Tooltip(
          message: 'Visit Github page.',
          verticalOffset: 80,
          child: IconButton(
            padding: const EdgeInsets.all(20),
            iconSize: 100,
            onPressed: () async {
              // TODO: Add a pop up in case the url launch fails.
              await launchUrl(
                Uri.https('github.com', '/JoelLV'),
              );
            },
            icon: const ImageIcon(
              AssetImage('assets/images/github-mark.png'),
            ),
          ),
        ),
        const Flexible(
          child: FractionallySizedBox(
            widthFactor: 0.25,
          ),
        ),
        Tooltip(
          message: 'Download Resume.',
          verticalOffset: 80,
          child: IconButton(
            padding: const EdgeInsets.all(20),
            iconSize: 100,
            onPressed: () async {
              // TODO: Add a pop up in case the url launch fails.
              await launchUrl(
                Uri.file('assets/assets/documents/resume.doc'),
              );
            },
            icon: const Icon(Icons.insert_drive_file_rounded),
          ),
        ),
        const Flexible(
          child: FractionallySizedBox(
            widthFactor: 0.25,
          ),
        ),
        Tooltip(
          message: 'Visit LinkedIn page.',
          verticalOffset: 80,
          child: IconButton(
            padding: const EdgeInsets.all(20),
            iconSize: 100,
            onPressed: () async {
              await launchUrl(
                Uri.https(
                  'www.linkedin.com',
                  '/in/joel-lopez-villarreal-455a80225',
                ),
              );
            },
            icon: const ImageIcon(
              AssetImage('assets/images/LI-In-Bug.png'),
            ),
          ),
        ),
      ],
    );
  }
}
