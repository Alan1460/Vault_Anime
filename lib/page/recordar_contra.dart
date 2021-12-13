// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:paginas/pallete.dart';
import 'package:paginas/widgets/widgets.dart';

class Rcontrasena extends StatelessWidget {
  const Rcontrasena({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children:  [
        const BackgroundImage(image: 'assets/image/bannerRecordar.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed:(){
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: kWhite,
              ),
            ) ,
            title: const Text('Recordar Contraseña',
            style: kBodytext,
            ),
            centerTitle: true,
          ),
          body: Column(
            children:[
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height:size.height * 0.1,
                    ),
                    Container(
                      width: size.width * 0.8,
                      child:Text(
                        'Ingrese su e-mail para restablecer su contraseña',
                        style: ktitletext,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //Inicio pendiente
              
              
              const SizedBox(
                height: 20,
              ),
              
              //boton pendiente
            ],
          ),
        )
      ],
    );
  }
}