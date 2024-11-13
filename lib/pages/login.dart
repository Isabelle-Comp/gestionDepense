import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoggedIn = false;  // L'état de connexion : initialement déconnecté
  final _emailController = TextEditingController();  // Contrôleur pour l'email
  final _passwordController = TextEditingController();  // Contrôleur pour le mot de passe

  // Méthode pour gérer la connexion
  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      // Simulation de la connexion : ici, vous pouvez ajouter la logique de validation avec un backend
      setState(() {
        _isLoggedIn = true;  // L'utilisateur est maintenant connecté
      });
    } else {
      // Si l'email ou le mot de passe sont vides, affichez un message d'erreur
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez entrer un email et un mot de passe')),
      );
    }
  }

  // Méthode pour gérer la déconnexion
  void _logout() {
    setState(() {
      _isLoggedIn = false;  // L'utilisateur est maintenant déconnecté
    });

    // Réinitialiser les champs de texte lorsque l'utilisateur se déconnecte
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion/Déconnexion'),
        actions: [
          // Affiche un bouton de déconnexion si l'utilisateur est connecté
          if (_isLoggedIn)
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: _logout, // Déconnexion
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Affiche un message différent selon si l'utilisateur est connecté ou non
              Text(
                _isLoggedIn
                    ? 'Bienvenue, vous êtes connecté !'
                    : 'Veuillez vous connecter.',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Si l'utilisateur est déconnecté, afficher les champs email et mot de passe
              if (!_isLoggedIn)
                Column(
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
                      obscureText: true,  // Masque le mot de passe
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _login,  // Appel à la méthode de connexion
                      child: const Text('Se connecter'),
                    ),
                  ],
                )
              else
              // Si l'utilisateur est connecté, afficher le bouton de déconnexion
                ElevatedButton(
                  onPressed: _logout, // Appel à la méthode de déconnexion
                  child: const Text('Se déconnecter'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
