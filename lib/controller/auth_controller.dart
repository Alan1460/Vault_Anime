
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paginas/page/home_page.dart';
import 'package:paginas/page/login_page.dart';
import 'package:paginas/pallete.dart';
class AuthController extends GetxController {

  static AuthController instance = Get.find();
  late Rx<User?> _user;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initalpages);
  }

  _initalpages(User? user){

    if (user==null) {
      Future.value("Login page");
      Get.offAll(()=>const LoginPage());
    }else{
      Get.offAll(()=>const HomePage());
    }
  }
  void register(String email, password) async{
    try {
    await auth.createUserWithEmailAndPassword(
        email: email,
        password: password);
    } catch (e){
      Get.snackbar("Sobre el registro", "mensaje de registro",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Creacion de usuario fallida",
          style: TextStyle(
            color: kWhite
          ),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: kWhite
          ),
        )
  
    );

    }
  }
  void login(String email, password) async{
    try {
    await auth.signInWithEmailAndPassword(
        email: email,
        password: password);
    } catch (e){
    Get.snackbar(
        "Sobre el inicio", "mensaje de inicio",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "inicio de sesion fallida",
          style: TextStyle(
            color: kWhite
          ),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: kWhite
          ),
        )
      );
      
    }  
  }

  void logOut()async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      Future.error("error");
    }
  }
  String userEmail() {
    String email = FirebaseAuth.instance.currentUser!.email ?? "a@a.com";
    return email;
  }

  String getUid() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return uid;
  }

}
