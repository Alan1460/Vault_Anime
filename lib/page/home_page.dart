import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paginas/controller/auth_controller.dart';
import 'package:paginas/widgets/chat_page.dart';
import 'package:paginas/widgets/firestore_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
AuthController authController = Get.find();
class _HomePageState extends State<HomePage> {

  int _selectIndex = 0;
  AuthController authController = Get.find();
  static final List<Widget> _widgets = <Widget>[const FireStorePage(), const ChatPage()];

  _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }
  _logOut() async {
    try {
    AuthController.instance.logOut();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Welcome ${authController.userEmail()}"),
          actions: [
            IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () {
                  _logOut();
                }),
          ]),
      body: _widgets.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Firestore"),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: "Chat")
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
