import 'package:flutter/material.dart';
import 'package:gestion_depenses/pages/onboardingWidget.dart';
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
        backgroundColor: Colors.blue,


        body: Stack(
          children: [
            PageView(
              children: const [
                OnboardingWidget(title: "GD", subtitle: "Gestion de Depense", image: "assets/images/img1.png"),
                OnboardingWidget(title: "", subtitle: "Plus besion de passer du temps a calculer manuellement ses depenses", image: "assets/images/img2.jpg"),
                OnboardingWidget(title: "", subtitle: "Visualiser vos depenses sous forme de graphe", image: "assets/images/img3.jpg"),


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
                      child: const Text('Se connecter'),
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
