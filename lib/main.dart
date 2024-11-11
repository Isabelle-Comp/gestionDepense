import 'package:flutter/material.dart';



void main() {

  print("bonjour");
  runApp(HomePage());

}

class HomePage extends StatefulWidget {
  //const HomePage({super.key});

  @override
  State<HomePage> createState() {
    // TODO: implement createElement
    return StatApp() ;
  }
}

class StatApp extends State<HomePage>{
  Color bg= Colors.lightBlue;
  int count=0;
  @override
  Widget build(BuildContext context){
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: Scaffold(

        appBar: AppBar(
          title: Text("Accueil"), elevation:122 ,

          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        drawer: Drawer(),
        body: Column(

            children: [
              Text("bonjour "),
              Text("chaque fois que vous que vous toucher le bouton en bas de lecran on increment notre compteur de 1 "),
              Text(" $count"),
            ]




        ),
        bottomNavigationBar: NavigationBar(

            backgroundColor: Colors.white ,
            destinations:[
              NavigationDestination(icon: Icon(Icons.message), label: "Message",  ),
              NavigationDestination(icon: Icon(Icons.phone), label: "appels"),
              NavigationDestination(icon: Icon(Icons.group), label: "communaute"),
            ]

        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){


          },
          child: Icon(Icons.icecream),
        ),
        backgroundColor: bg,
      ),
      theme:ThemeData(
          colorSchemeSeed: Colors.red,
          scaffoldBackgroundColor: Colors.white
      ),
    );
  }
}

