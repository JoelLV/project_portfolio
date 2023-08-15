import 'package:flutter/material.dart';

enum Technology {
  php(name: 'PHP', bannerColor: Color.fromRGBO(50, 126, 240, 1)),
  javascript(name: 'JavaScript', bannerColor: Color.fromRGBO(234, 211, 0, 1)),
  jquery(name: 'JQuery', bannerColor: Color.fromRGBO(0, 151, 234, 1)),
  yii2(name: 'Yii2', bannerColor: Color.fromRGBO(202, 38, 2, 1)),
  mariaDb(name: 'MariaDB', bannerColor: Color.fromRGBO(25, 105, 149, 1)),
  apache(name: 'Apache', bannerColor: Color.fromRGBO(229, 143, 43, 1)),
  flutter(name: 'Flutter', bannerColor: Color.fromARGB(255, 100, 169, 226)),
  typescript(
    name: 'Typescript',
    bannerColor: Color.fromARGB(255, 103, 90, 186),
  ),
  reactJs(name: 'ReactJS', bannerColor: Color.fromARGB(255, 50, 191, 64)),
  golang(name: 'Golang', bannerColor: Color.fromARGB(255, 75, 200, 241)),
  python(name: 'Python', bannerColor: Color.fromARGB(255, 73, 133, 182)),
  dart(name: 'Dart', bannerColor: Color.fromARGB(255, 76, 94, 253)),
  csharp(name: 'C#', bannerColor: Color.fromARGB(255, 38, 163, 70)),
  cplusplus(name: 'C++', bannerColor: Color.fromARGB(255, 1, 48, 86)),
  c(name: 'C', bannerColor: Color.fromARGB(255, 76, 202, 209)),
  dotnet(name: '.NET', bannerColor: Color.fromARGB(255, 228, 79, 89)),
  html(name: 'HTML', bannerColor: Color.fromARGB(255, 241, 124, 57)),
  css(name: 'CSS', bannerColor: Color.fromARGB(255, 216, 50, 211)),
  sqlite(name: 'SQLite', bannerColor: Color.fromARGB(255, 171, 245, 59)),
  nestJs(name: 'NestJS', bannerColor: Color.fromARGB(255, 201, 73, 47)),
  mySql(name: 'MySql', bannerColor: Color.fromARGB(255, 104, 202, 213));

  const Technology({required this.name, required this.bannerColor});

  final String name;
  final Color bannerColor;

  static List<Technology> get allTechnologies => [
        php,
        javascript,
        jquery,
        yii2,
        mariaDb,
        apache,
        flutter,
        typescript,
        reactJs,
        golang,
        python,
        dart,
        csharp,
        cplusplus,
        c,
        dotnet,
        html,
        css,
        sqlite,
        nestJs,
      ];
}
