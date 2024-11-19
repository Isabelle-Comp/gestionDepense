import 'package:flutter/material.dart';
import 'inscription.dart'; // Import de la page d'inscription

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController(); // Contrôleur pour l'email
  final _passwordController = TextEditingController(); // Contrôleur pour le mot de passe

  // Méthode pour gérer la connexion
  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      // Logique de connexion (backend ou logique locale)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Connexion réussie')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez entrer un email et un mot de passe')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Mot de passe',
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true, // Masque le mot de passe
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login, // Appel à la méthode de connexion
                child: const Text('Se connecter'),
              ),
              TextButton(
                onPressed: () {
                  // Naviguer vers la page d'inscription
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Inscription()),
                  );
                },
                child: const Text("Pas de compte ? S'inscrire"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
