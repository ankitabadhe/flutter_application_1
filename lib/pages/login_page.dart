import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(children: [
          Image.asset("assets/images/login_img.png", fit: BoxFit.cover),
          const SizedBox(
            height: 10.0,
          ),
          const Text("WELCOME",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                      decoration: const InputDecoration(
                    hintText: "Enter Username",
                    labelText: "Username",
                  )),
                  TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ))
                ],
              ))
        ]));
  }
}
