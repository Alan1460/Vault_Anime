import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paginas/controller/auth_controller.dart';
import 'package:paginas/page/login_page.dart';
import 'package:paginas/pallete.dart';
import 'package:paginas/widgets/background_image.dart';


class CrearNuevoUsuario extends StatelessWidget {
  const CrearNuevoUsuario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();
    return Stack(
      children:[
        const BackgroundImage(image:'assets/image/Registro1.png',),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.3,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX:0,
                          sigmaY: 0),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: kyellow,
                            child: Icon(
                            FontAwesomeIcons.user,
                            color: Colors.black,
                            size: size.width * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height:size.width * 0.1 ,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: kyellow,
                          shape: BoxShape.circle,
                          border: Border.all
                          (color: Colors.black, width:2)
                        ),
                        child: const Icon(
                          FontAwesomeIcons.arrowUp,
                          color: Colors.black,
                          ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Column(
                  children:[

                    //email
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
          
                    //contraseña

                    
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
                  
                    const SizedBox(
                      height: 25,
                    ),

                    //boton
                    Container(
                     height: size.height * 0.08,
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.redAccent
                      ),
                      child: TextButton (onPressed: (){
                          AuthController.instance.register(
                          emailcontroller.text.trim(),
                          passwordcontroller.text.trim()
                          );
                      },
                      child: const Text(
                        'Registrar',
                        style: kBodytext,
                      ),
                    ),
                ),

                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children:[
                        const Text(
                          '¿Ya tienes una cuenta?',
                          style: kBodytext,
                        ),
                        GestureDetector(
                          onTap: () =>  Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, a, b) =>
                    const LoginPage(),
                    transitionDuration: const Duration(
                      seconds: 0),
                    ),
                    (route) => false
                  ),
                          child: Text(
                            'Inicia sesion',
                            style: kBodytext.copyWith(
                            color: kred,
                            fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        )

      ],
    );
    
  }
}
