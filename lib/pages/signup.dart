import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:firebaselogin/Widgets/formcard2.dart';
import 'package:firebaselogin/logic/cubit/RegisterCubit/cubit/register_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupnewPage extends StatefulWidget {
  const SignupnewPage({super.key});

  @override
  State<SignupnewPage> createState() => _LoginnewPageState();
}

class _LoginnewPageState extends State<SignupnewPage> {
  bool _isSelected = false;
  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
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
  Widget build(BuildContext context) {
    var c = context.watch<SignupCubit>();

    var status = c.state.status;
    switch (status) {
      case Status2.initial:
        log('Initial');
        break;
      case Status2.loading:
        log('loading');
        break;
      case Status2.success:
        log('Success');
        context.router.replaceNamed('/dashboard');
        break;
      case Status2.error:
        log('Error');
        break;
      case Status2.weakpassword:
        log('weak Password');
        break;
      case Status2.userexist:
        log('userexist');
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
                  FormCard2(
                    passwordcontroller: registerPasswordController,
                    emailcontroller: registerEmailController,
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
                                context.read<SignupCubit>().registerUser(
                                    email: registerEmailController.text,
                                    password: registerPasswordController.text);
                              },
                              child: const Center(
                                child: Text("SIGNUP",
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
