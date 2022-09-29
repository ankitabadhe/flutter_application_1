import 'package:flutter/material.dart';

import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(children: [
            Image.asset(
              "assets/images/hey.png",
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20.0),
            Text('WELL-COME  $name',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10.0),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Enter Username", labelText: "Username"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username cannot be empty !";
                      } else if (value.length < 6) {
                        return "Username should be atleast 6 digit long !";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty !";
                      } else if (value.length < 6) {
                        return "Password should be atleast 6 digit long !";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 40.0),
                  Material(
                    color: Colors.deepPurple,
                    // shape:
                    //     changeButton ? BoxShape.circle : BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(changeButton ? 6 : 8),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                          height: 50,
                          width: changeButton ? 50 : 100,
                          alignment: Alignment.center,
                          duration: const Duration(seconds: 1),
                          child: changeButton
                              ? const Icon(Icons.done, color: Colors.white)
                              : const Text("LOG-IN",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15))),
                    ),
                  )
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   },
                  //   style: TextButton.styleFrom(minimumSize: const Size(90, 40)),
                  //   child: const Text("LOG-IN"),
                ]))
          ]),
        )));
  }
}
