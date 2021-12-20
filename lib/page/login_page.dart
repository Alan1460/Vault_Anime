
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paginas/controller/auth_controller.dart';
import 'package:paginas/page/crear_nuevo_usuario.dart';
import 'package:paginas/pallete.dart';
import 'package:paginas/widgets/widgets.dart';

import 'pages_export.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();
    return Stack(
      children: [
        const BackgroundImage(image: 'assets/image/BannerFlores.jpg',),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Flexible(
                child: Center(
                  child: Text(
                    'Vault Anime',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:60,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children:[

                    //Email
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.redAccent.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child:  Center(
                          child: TextField(
                            controller: emailcontroller,
                            decoration: const InputDecoration(
                              prefixIcon: 
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Icon(FontAwesomeIcons.envelope,
                                size: 30,
                                color: kWhite,),
                              ),
                              border: InputBorder.none,
                              hintText: 'E-mail',
                              hintStyle: kBodytext,
                            ),
                            style: kBodytext,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        
                    ),
                  ),

                        //Contraseña
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.redAccent.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child:  Center(
                          child: TextField(
                            controller: passwordcontroller,
                            decoration: const InputDecoration(
                              prefixIcon: 
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Icon(FontAwesomeIcons.lock,
                                size: 30,
                                color: kWhite,),
                              ),
                              border: InputBorder.none,
                              hintText: 'Contraseña',
                              hintStyle: kBodytext,
                            ),
                            obscureText: true,
                            style: kBodytext,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                        
                    ),
                  ),

                  GestureDetector(
                    onTap:() => Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, a, b) =>
                    const Rcontrasena(),
                    transitionDuration: const Duration(
                      seconds: 0),
                    ),
                    (route) => false
                  ),
                    child: const Text(
                      'Olvido su Contraseña?',
                      style: kBodytext,
                      ),
                  ),

                  const SizedBox(
                    height: 25,
                    ),

                    //Botones
                    Container(
                     height: size.height * 0.08,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.redAccent
                      ),
                      child: TextButton(
                        onPressed: () {
                        AuthController.instance.login(
                          emailcontroller.text.trim(),
                          passwordcontroller.text.trim());
                      },
                      child: const Text(
                        'iniciar sesion',
                        style: kBodytext,
                      ),
                    ),
                ),

                  const SizedBox(
                    height: 25,
                  ),
                ]
              ),
              GestureDetector(
                onTap: () => 
                Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, a, b) =>
                    const CrearNuevoUsuario(),
                    transitionDuration: const Duration(
                      seconds: 0),
                    ),
                    (route) => false
                  ),
                  child: Container(
                  child: const Text(
                    'Crear una nueva cuenta',
                    style: kBodytext,
                    ),
                    decoration:const BoxDecoration(border: Border(
                      bottom: BorderSide(width: 1,
                      color: kWhite))),
                  ),
                ),

              const SizedBox(
                height: 20,
              )
            ],
          ),
        )
      ],
    );


  }
}