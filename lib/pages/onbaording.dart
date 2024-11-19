import 'package:flutter/material.dart';
import 'package:gestion_depenses/pages/onboardingWidget.dart';
import 'login.dart';
import 'inscription.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: const [
              OnboardingWidget(title: "GD", subtitle: "Gestion de Depense", image: "assets/images/img1.png"),
              OnboardingWidget(title: "", subtitle: "Plus besoin de passer du temps à calculer manuellement ses dépenses", image: "assets/images/img2.jpg"),
              OnboardingWidget(title: "", subtitle: "Visualisez vos dépenses sous forme de graphe", image: "assets/images/img3.jpg"),
            ],
          ),
          Positioned(
            bottom: 30,
            left: 30,
            right: 30,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: index == _currentPage ? Colors.black : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text('Se connecter'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpPage()), // Redirection vers la page d'inscription
                    );
                  },
                  child: const Text("S'inscrire"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
