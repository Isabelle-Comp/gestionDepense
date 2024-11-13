import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  //const HomePage({super.key});

  @override
  State<LoadingPage> createState() {
    // TODO: implement createElement
    return LoadingPageState() ;
  }
}

class LoadingPageState extends State<LoadingPage>{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Center(
          child: const Text("loading page"),
      ),
    );
  }
}