import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(children: [
          Image.asset("assets/images/login_img.png", fit: BoxFit.cover),
          const SizedBox(height: 20.0),
          const Text("WELL-COME",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10.0),
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
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
                    )),
                const SizedBox(height: 40.0),
                ElevatedButton(
                  onPressed: () {
                    // ignore: avoid_print
                    print("Hi Ankita");
                  },
                  style: TextButton.styleFrom(),
                  child: const Text("LOG-IN"),
                )
              ]))
        ]));
  }
}
