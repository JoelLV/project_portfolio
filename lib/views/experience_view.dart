import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SelectableText(
                  'Most relevant work experience:',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 28,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: _WorkExperienceBox(
                        title: 'Web Developer at CIRC',
                        timePeriod: 'May 2021-August 2023',
                        description:
                            'Responsibilities: In this company, I was a full stack '
                            'developer in charge of creating web applications using '
                            'primarily the Yii2 framework, which was written in PHP. '
                            'Due to the architecture encouraged by this framework, '
                            'I became very familiar with the MVC architecture. '
                            'I also became very experienced with ORMs, RESTful APIs, '
                            'several types of testing (unit, functional, and acceptance), '
                            'and database management. Since the company used Apache as its '
                            'server, I also became familiar with the basics of Apache. '
                            'Some projects that I helped create when working with this company '
                            'include a content authoring web app, a mission trip management app, '
                            'and a game-based learning app. During my last months with '
                            'this company, I worked with small prototypes that used '
                            'Flutter as its front-end framework, so I\'m experienced '
                            'with the basics of cross-platform application development.',
                        url:
                            'https://www.southern.edu/academics/computing/circ.html',
                        techBadges: const [
                          _TechBadge(
                            content: 'PHP',
                            color: Color.fromRGBO(50, 126, 240, 1),
                          ),
                          _TechBadge(
                            content: 'JavaScript',
                            color: Color.fromRGBO(234, 211, 0, 1),
                          ),
                          _TechBadge(
                            content: 'JQuery',
                            color: Color.fromRGBO(0, 151, 234, 1),
                          ),
                          _TechBadge(
                            content: 'Yii2',
                            color: Color.fromRGBO(202, 38, 2, 1),
                          ),
                          _TechBadge(
                            content: 'MariaDB',
                            color: Color.fromRGBO(25, 105, 149, 1),
                          ),
                          _TechBadge(
                            content: 'Apache',
                            color: Color.fromRGBO(229, 143, 43, 1),
                          ),
                          _TechBadge(
                            content: 'Flutter',
                            color: Color.fromARGB(255, 100, 169, 226),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WorkExperienceBox extends StatelessWidget {
  _WorkExperienceBox({
    required this.title,
    required this.timePeriod,
    required this.description,
    required this.techBadges,
    this.url,
  });

  final String title;
  final String timePeriod;
  final String description;
  final String? url;
  final List<_TechBadge> techBadges;
  final ScrollController _techStackScrollableController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;

    return PhysicalModel(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      shadowColor: Colors.black38,
      elevation: 10,
      child: SizedBox(
        width: 1120,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 45,
            right: 45,
            top: 25,
            bottom: 25,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectableText(
                    title,
                    style:
                        TextStyle(fontSize: 25, color: primaryColor, height: 2),
                  ),
                  SelectableText(
                    timePeriod,
                    style:
                        TextStyle(fontSize: 15, color: primaryColor, height: 1),
                  ),
                  if (url != null)
                    IconButton(
                      onPressed: () {
                        launchUrl(Uri.parse(url!));
                      },
                      icon: const Icon(
                        Icons.info_outline,
                      ),
                      tooltip: 'Go to company\'s website.',
                    ),
                ],
              ),
              VerticalDivider(
                color: primaryColor,
                thickness: 0.4,
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Scrollbar(
                        thickness: 4,
                        controller: _techStackScrollableController,
                        child: ListView(
                          controller: _techStackScrollableController,
                          scrollDirection: Axis.horizontal,
                          children: techBadges.map<Widget>((badge) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Center(
                                child: badge,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SelectableText(
                        description,
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TechBadge extends StatelessWidget {
  const _TechBadge({required this.content, required this.color});

  final String content;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: color,
      ),
      child: Center(
        child: Text(
          content,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
