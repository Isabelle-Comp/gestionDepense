import 'package:flutter/material.dart';





class HomePage extends StatefulWidget {
  const HomePage({super.key});

  //const HomePage({super.key});

  @override
  State<HomePage> createState() {
    // TODO: implement createElement
    return StatApp() ;
  }
}

class StatApp extends State<HomePage>{

  int count=0;
  @override
  Widget build(BuildContext context){
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: Scaffold(

        appBar: AppBar(
          title: const Text("Accueil"), elevation:122 ,

          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        drawer: const Drawer(),
        body: Column(

            children: [
              const Text("bonjour "),
              const Text("chaque fois que vous que vous toucher le bouton en bas de lecran on increment notre compteur de 1 "),
              Text(" $count"),
            ]




        ),
        bottomNavigationBar: NavigationBar(

            backgroundColor: Colors.white ,
            destinations:const [
              NavigationDestination(icon: Icon(Icons.message), label: "Message",  ),
              NavigationDestination(icon: Icon(Icons.phone), label: "appels"),
              NavigationDestination(icon: Icon(Icons.group), label: "communaute"),
            ]

        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){


          },
          child: const Icon(Icons.icecream),
        ),

      ),
      theme:ThemeData(
          colorSchemeSeed: Colors.blue,
          scaffoldBackgroundColor: Colors.white
      ),
    );
  }
}

