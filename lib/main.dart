import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_portfolio/widgets/main_app_bar.dart';
import 'package:project_portfolio/views/about_me_view.dart';
import 'package:project_portfolio/views/experience_view.dart';
import 'views/home_view.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          appBar: const MainAppBar(),
          body: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/experience',
          builder: (context, state) => const ExperiencePage(),
        ),
        GoRoute(
          path: '/about-me',
          builder: (context, state) => const AboutMePage(),
        ),
      ],
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Project Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        canvasColor: const Color.fromRGBO(248, 252, 255, 1),
        fontFamily: GoogleFonts.mukta().fontFamily,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromRGBO(0, 74, 115, 1),
          onPrimary: Color.fromRGBO(232, 244, 253, 1),
          secondary: Color.fromRGBO(224, 242, 255, 1),
          onSecondary: Color.fromRGBO(0, 74, 115, 1),
          error: Colors.red,
          onError: Colors.white,
          background: Color.fromRGBO(248, 252, 255, 1),
          onBackground: Color.fromRGBO(0, 74, 115, 1),
          surface: Color.fromRGBO(224, 242, 255, 1),
          onSurface: Color.fromRGBO(0, 74, 115, 1),
        ),
        primaryColor: const Color.fromRGBO(0, 74, 115, 1),
        tooltipTheme: const TooltipThemeData(
          waitDuration: Duration(milliseconds: 400),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor:
                const MaterialStatePropertyAll(Color.fromRGBO(0, 74, 115, 1)),
            overlayColor:
                MaterialStatePropertyAll(Colors.black12.withOpacity(0.05)),
          ),
        ),
      ),
      routerConfig: _router,
    );
  }
}
