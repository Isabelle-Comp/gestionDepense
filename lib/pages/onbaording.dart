import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget{
  const OnboardingPage({super.key});

  @override
  OnboardingPageState createState()=>OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,

        home:  Scaffold(
          body: Stack(
              children: [
                PageView(
                  children: [
                    Text(" page1"),
                    Text(" page2"),
                    Text(" page3"),
                  ],
                )
              ],
            )


        ),
    );
  }
}