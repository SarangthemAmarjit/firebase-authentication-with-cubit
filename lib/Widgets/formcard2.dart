import 'package:flutter/material.dart';

class FormCard2 extends StatelessWidget {
  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;

  const FormCard2(
      {super.key,
      required this.emailcontroller,
      required this.passwordcontroller});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
//      height: ScreenUtil.getInstance().setHeight(500),
      padding: const EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text("New Registration",
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),
            const SizedBox(height: 30),
            const Text("Name",
                style: TextStyle(fontFamily: "Poppins-Medium", fontSize: 15)),
            TextField(
              controller: emailcontroller,
              decoration: const InputDecoration(
                  hintText: "username",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            const Text("Email",
                style: TextStyle(fontFamily: "Poppins-Medium", fontSize: 15)),
            TextField(
              controller: emailcontroller,
              decoration: const InputDecoration(
                  hintText: "username",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            const SizedBox(height: 30),
            const Text("PassWord",
                style: TextStyle(fontFamily: "Poppins-Medium", fontSize: 15)),
            TextField(
              obscureText: true,
              controller: passwordcontroller,
              decoration: const InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
            ),
            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
