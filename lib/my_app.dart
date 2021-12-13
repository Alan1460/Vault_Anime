import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paginas/controller/auth_controller.dart';
import 'package:paginas/controller/chat_controller.dart';
import 'package:paginas/controller/firestore_controller.dart';
import 'firebase_central.dart';


class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Vault Anime",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    
      home: Scaffold(
          body: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Future.error("error ${snapshot.error}");
            return const Wrong();
          }
          
          if (snapshot.connectionState == ConnectionState.done) {
            Get.put(FirebaseController());
            Get.put(AuthController());
            Get.put(ChatController());
            return const FirebaseCentral();
          }

          return const Loading(
          );
        },
      )
    ),
//
    );
  }
}

class Wrong extends StatelessWidget {
  const Wrong({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Something went wrong"));
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Loading"));
  }
}