import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.white,
      child: const CircularProgressIndicator(
        backgroundColor: Colors.redAccent,
      ) ,
    );
  }
}