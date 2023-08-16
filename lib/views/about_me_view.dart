import 'package:flutter/material.dart';
import 'package:project_portfolio/models/about_me_description.dart';
import 'package:project_portfolio/views/home_view.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceWidthIsSmall = MediaQuery.of(context).size.width <= 300;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.asset(
                  'assets/images/profile_picture.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 600,
                child: MainResourceButtons(
                  iconButtonSize: deviceWidthIsSmall ? 45 : 60,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  bottom: 100,
                ),
                width: 700,
                child: SelectableText(
                  AboutMeDescription.description,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
