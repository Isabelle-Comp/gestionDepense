import 'package:flutter/material.dart';

class OnboardingWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const OnboardingWidget({
    Key? Key, required this.title, required this.subtitle, required this.image});


  @override
  Widget build(BuildContext context) {
    return Stack(

        children: [
          Positioned.fill(child: Image.asset(image, fit: BoxFit.fitWidth)),
          Positioned.fill(child: Container(
            child: Column(
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ))

        ]
    );
  }


  }