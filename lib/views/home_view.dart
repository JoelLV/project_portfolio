import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var isDesktop = MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const _TitleSection(),
          SizedBox(
            height: isDesktop ? 70 : 25,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 50),
            child: MainResourceButtons(
              iconButtonSize: isDesktop ? 100 : 50,
            ),
          ),
        ],
      ),
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection();

  @override
  Widget build(BuildContext context) {
    var isDesktop = MediaQuery.of(context).size.width >= 800;
    return Flex(
      direction: isDesktop ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(isDesktop ? 220 : 180),
          child: Image.asset(
            'assets/images/profile_picture.jpg',
            alignment: Alignment.center,
            width: isDesktop ? 220 : 180,
            height: isDesktop ? 220 : 180,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: isDesktop ? 50 : null,
          height: !isDesktop ? 30 : null,
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
                fontSize: isDesktop ? 45 : 30,
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
              'Welcome to my Portfolio',
              style: TextStyle(
                letterSpacing: 2,
                color: Theme.of(context).primaryColor.withOpacity(.44),
                fontSize: isDesktop ? 25 : 18,
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

class MainResourceButtons extends StatelessWidget {
  const MainResourceButtons({super.key, required this.iconButtonSize});

  final double iconButtonSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Tooltip(
          message: 'Visit Github page.',
          verticalOffset: iconButtonSize - 20,
          child: IconButton(
            padding: const EdgeInsets.all(20),
            iconSize: iconButtonSize,
            onPressed: () async {
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
          verticalOffset: iconButtonSize - 20,
          child: IconButton(
            padding: const EdgeInsets.all(20),
            iconSize: iconButtonSize,
            onPressed: () async {
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
          verticalOffset: iconButtonSize - 20,
          child: IconButton(
            padding: const EdgeInsets.all(20),
            iconSize: iconButtonSize,
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
