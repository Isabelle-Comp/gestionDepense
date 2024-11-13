import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => StatApp();
}

class StatApp extends State<HomePage> {
  Color bg = Colors.lightBlue;
  int count = 0;
  bool isLoggedIn = false; // Variable pour vérifier si l'utilisateur est connecté

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkLoginStatus(); // Vérifier le statut de connexion lors du lancement de l'app
  }

  // Vérifie si l'utilisateur est connecté
  _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    });
  }

  // Fonction pour se connecter
  _login() async {
    String email = emailController.text;
    String password = passwordController.text;

    // Simuler une vérification simple (vous pouvez remplacer par une vraie logique d'authentification)
    if (email == "user@example.com" && password == "password123") {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      setState(() {
        isLoggedIn = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Identifiants incorrects"),
      ));
    }
  }

  // Fonction pour se déconnecter
  _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    setState(() {
      isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Accueil"),
          elevation: 122,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        drawer: Drawer(),
        body: isLoggedIn
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bienvenue !",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text("Compteur: $count"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _logout,
              child: Text("Se déconnecter"),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: Icon(Icons.add),
            ),
          ],
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Mot de passe'),
                obscureText: true,
              ),
            ),
            ElevatedButton(
              onPressed: _login,
              child: Text("Se connecter"),
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white,
          destinations: [
            NavigationDestination(icon: Icon(Icons.message), label: "Message"),
            NavigationDestination(icon: Icon(Icons.phone), label: "Appels"),
            NavigationDestination(icon: Icon(Icons.group), label: "Communauté"),
          ],
        ),
        backgroundColor: bg,
      ),
      theme: ThemeData(
        colorSchemeSeed: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
