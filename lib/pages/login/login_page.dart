import 'package:flutter/material.dart';
import 'package:curso/utils/colors.dart' as colors;
import 'package:curso/utils/images.dart' as images;
import 'package:curso/routes/router.dart' as router;
import 'package:curso/utils/validators.dart' as validators;
import 'package:flutter/services.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: colors.lightBlue,
      ),
      child: Scaffold(
        backgroundColor: colors.lightBlue,
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Image.asset(
                    images.dockerLogo,
                    height: MediaQuery.of(context).size.height * 0.187,
                    /*height: 171,*/
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.0349,
                    /*height: 32,*/
                  ),
                  const Text(
                    "Iniciar Sesión",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Outfit",
                      fontStyle: FontStyle.normal,
                      fontSize: 32.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.0273,
                    /*height: 24,*/
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6692,
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.0947,
                    ),
                    decoration: const BoxDecoration(
                        color: colors.grey,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                            30,
                          ),
                          topLeft: Radius.circular(
                            30,
                          ),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0218,
                        ),
                        const Text(
                          "Bienvenido",
                          style: TextStyle(
                            color: colors.lightBlue,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Outfit",
                            fontStyle: FontStyle.normal,
                            fontSize: 32.0,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                style: TextStyle(
                                  color: colors.blackText,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: "Outfit",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20.0,
                                ),
                                text: "Ingresa tus datos para ",
                              ),
                              TextSpan(
                                style: TextStyle(
                                  color: colors.lightBlue,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Outfit",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20.0,
                                ),
                                text: "Iniciar sesión",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0204,
                        ),
                        const Text(
                          "Usuario",
                          style: TextStyle(
                            color: colors.lightBlue,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Outfit",
                            fontStyle: FontStyle.normal,
                            fontSize: 24.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        TextFormField(
                          validator: validators.validateTextInput,
                          decoration: const InputDecoration(
                              hintText: "Usuario",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                borderSide: BorderSide(
                                  color: colors.lightBlue,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                borderSide: BorderSide(
                                  color: colors.lightBlue,
                                ),
                              ),
                              suffixIcon: Icon(
                                Icons.person_outline,
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0204,
                        ),
                        const Text(
                          "Contraseña",
                          style: TextStyle(
                            color: colors.lightBlue,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Outfit",
                            fontStyle: FontStyle.normal,
                            fontSize: 24.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        TextFormField(
                          validator: validators.validateTextInput,
                          decoration: const InputDecoration(
                            hintText: "Ingresa tu contraseña",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: colors.lightBlue,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: colors.lightBlue,
                              ),
                            ),
                            suffixIcon: IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.visibility_off_outlined,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0261,
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Olvidé mi contraseña",
                            style: TextStyle(
                                color: colors.lightBlue,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Outfit",
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0,
                                decoration: TextDecoration.underline),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0546,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.popAndPushNamed(
                                context, router.homeRoute);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.791,
                            height: MediaQuery.of(context).size.height * 0.0656,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: colors.blackShadow,
                                  offset: Offset(4, 4),
                                  blurRadius: 12,
                                  spreadRadius: -2,
                                )
                              ],
                              color: colors.lightBlue,
                            ),
                            child: const Center(
                              child: Text(
                                "Ingresar ",
                                style: TextStyle(
                                  color: colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Outfit",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 28.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.0218,
                        ),
                        const Center(
                          child: Text(
                            "¿No tienes una cuenta?",
                            style: TextStyle(
                                color: colors.lightBlue,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Outfit",
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0,
                                decoration: TextDecoration.underline),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
