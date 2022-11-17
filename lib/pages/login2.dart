import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:firebaselogin/Widgets/FormCard.dart';
import 'package:firebaselogin/logic/cubit/Login/login_cubit.dart';
import 'package:firebaselogin/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginnewPage extends StatefulWidget {
  const LoginnewPage({super.key});

  @override
  State<LoginnewPage> createState() => _LoginnewPageState();
}

class _LoginnewPageState extends State<LoginnewPage> {
  bool _isSelected = false;
  TextEditingController loginEmailController = TextEditingController();

  TextEditingController loginPasswordController = TextEditingController();
  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  @override
  void initState() {
    checking();
    super.initState();
  }

  checking() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('uid')) {
      context.router.replaceNamed('/dashboard');
    } else {
      context.router.replaceNamed('/loginpage');
    }
  }

  @override
  Widget build(BuildContext context) {
    var c = context.watch<LoginCubit>();

    var status = c.state.status;
    switch (status) {
      case Status.initial:
        log('Initial');
        break;
      case Status.loading:
        log('loading');
        break;
      case Status.loaded:
        context.router.replaceNamed('/dashboard');
        log('Loaded');
        break;
      case Status.error:
        log('Error');
        break;
      default:
    }
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset("assets/image_01.png"),
              ),
              const SizedBox(
                height: 400,
              ),
              Expanded(child: Image.asset("assets/image_02.png"))
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset("assets/logo.png", width: 60, height: 110),
                      const Text("LOGO",
                          style: TextStyle(
                              fontFamily: "Poppins-Bold",
                              fontSize: 18,
                              letterSpacing: .6,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  const SizedBox(height: 70),
                  FormCard(
                    passwordcontroller: loginPasswordController,
                    emailcontroller: loginEmailController,
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          width: 130,
                          height: 50,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [
                                Color(0xFF17ead9),
                                Color(0xFF6078ea)
                              ]),
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        const Color(0xFF6078ea).withOpacity(.3),
                                    offset: const Offset(0.0, 8.0),
                                    blurRadius: 8.0)
                              ]),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                context.read<LoginCubit>().loginUser(
                                    email: loginEmailController.text,
                                    password: loginPasswordController.text);
                              },
                              child: const Center(
                                child: Text("SIGNIN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins-Bold",
                                        fontSize: 18,
                                        letterSpacing: 1.0)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "New User? ",
                        style: TextStyle(fontFamily: "Poppins-Medium"),
                      ),
                      InkWell(
                        onTap: () {
                          context.router.push(const SignupnewRoute());
                        },
                        child: const Text("SignUp",
                            style: TextStyle(
                                color: Color(0xFF5d74e3),
                                fontFamily: "Poppins-Bold")),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
