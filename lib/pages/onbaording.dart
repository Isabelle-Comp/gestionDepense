import 'package:flutter/material.dart';
import 'login.dart';  // Importez la page de connexion/déconnexion

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            PageView(
              children: [
                // Page 1 du onboarding
                Container(
                  color: Colors.blue,
                  child: Center(child: Text("Page 1")),
                ),
                // Page 2 du onboarding
                Container(
                  color: Colors.green,
                  child: Center(child: Text("Page 2")),
                ),
                // Page 3 du onboarding
                Container(
                  color: Colors.orange,
                  child: Center(child: Text("Page 3")),
                ),
              ],
            ),
            // Ajouter un bouton pour accéder à la page de connexion
            Positioned(
              bottom: 30,
              left: 30,
              right: 30,
              child: ElevatedButton(
                onPressed: () {
                  // Naviguer vers la page de connexion
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text('Se connecter'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
