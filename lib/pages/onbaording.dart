import 'package:flutter/material.dart';
import 'login.dart'; // Importez la page de connexion/déconnexion

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
        appBar: AppBar(),
        body: Stack(
          children: [
            PageView(
              children: [
                // Page 1 du onboarding
                Container(
                  color: Colors.blue,
                  child: const Center(child: Text("Page 1")),
                ),
                // Page 2 du onboarding
                Container(
                  color: Colors.green,
                  child: const Center(child: Text("Page 2")),
                ),
                // Page 3 du onboarding
                Container(
                  color: Colors.orange,
                  child: const Center(child: Text("Page 3")),
                ),
              ],
            ),
            // Ajouter un bouton pour accéder à la page de connexion
            Positioned(
              bottom: 30,
              left: 30,
              right: 30,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) =>
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 3),
                          width: 10,
                          height: 10,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: index == 0 ? Colors.black : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ),
                  ),
                  const SizedBox(height: 20), // Espacement entre le bouton et les indicateurs
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        // Naviguer vers la page de connexion
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                      child: const Text('Commencer'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
