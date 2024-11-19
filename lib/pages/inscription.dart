import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _firstNameController = TextEditingController(); // Contrôleur pour le prénom
  final _lastNameController = TextEditingController();  // Contrôleur pour le nom
  final _emailController = TextEditingController(); // Contrôleur pour l'email
  final _passwordController = TextEditingController(); // Contrôleur pour le mot de passe
  final _confirmPasswordController = TextEditingController(); // Contrôleur pour la confirmation du mot de passe
  final _birthdateController = TextEditingController(); // Contrôleur pour la date de naissance

  // Méthode pour gérer l'inscription
  void _signUp() {
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;
    final birthdate = _birthdateController.text;

    if (firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        birthdate.isNotEmpty) {
      if (password == confirmPassword) {
        // Logique d'inscription réussie
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Inscription réussie!')),
        );
        Navigator.pop(context); // Revenir à la page de connexion après l'inscription
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Les mots de passe ne correspondent pas')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inscription'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  labelText: 'Prénom',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Nom',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _birthdateController,
                decoration: const InputDecoration(
                  labelText: 'Date de naissance',
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                keyboardType: TextInputType.datetime,
              ),
              const SizedBox(height: 10),
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
              const SizedBox(height: 10),
              TextField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Confirmer le mot de passe',
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true, // Masque le mot de passe
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signUp, // Appel à la méthode d'inscription
                child: const Text('S\'inscrire'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Revenir à la page de connexion
                },
                child: const Text("Vous avez déjà un compte ? Connectez-vous"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
