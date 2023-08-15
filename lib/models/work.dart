import 'package:project_portfolio/models/technology.dart';

class Work {
  const Work({
    required this.title,
    required this.timePeriod,
    required this.description,
    required this.techStack,
    this.url,
  });

  final String title;
  final String timePeriod;
  final String description;
  final List<Technology> techStack;
  final String? url;

  static List<Work> get workExperiences {
    return [
      const Work(
        techStack: [
          Technology.php,
          Technology.javascript,
          Technology.jquery,
          Technology.yii2,
          Technology.mariaDb,
          Technology.apache,
          Technology.flutter,
          Technology.dart,
        ],
        description: 'Responsibilities: In this company, I was a full stack '
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
        timePeriod: 'May 2021 - August 2023',
        title: 'Web Developer at CIRC',
        url: 'https://www.southern.edu/academics/computing/circ.html',
      )
    ];
  }
}
