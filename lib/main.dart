import 'package:flutter/material.dart';
import 'onboarding.dart';




void main() {

  print("bonjour");
  runApp(const App());

}

class App extends StatefulWidget {
  const App({super.key});

  //const HomePage({super.key});

  @override
  State<App> createState() {
    // TODO: implement createElement
    return StatApp() ;
  }
}

class StatApp extends State<App>{


  @override
  Widget build(BuildContext context){
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: const OnboardingPage(),
      theme:ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

