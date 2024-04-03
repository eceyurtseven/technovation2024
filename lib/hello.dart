import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:technovation2024/registration.dart';
import 'package:technovation2024/sign_in.dart';

class HelloPage extends ConsumerWidget {
  static String path = "/hello";

  const HelloPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      //backgroundColor: Color.fromRGBO(3, 9, 66, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /*
          Logo(),
          SizedBox(
            height: 16,
          ),
          */
          Center(
              child: Text(
            "Welcome to EnviroRoot",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).primaryColor,
                  //fontSize: 28,
                  // fontWeight: FontWeight.normal
                ),
          )),
          SizedBox(
            height: 16,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                      onPressed: () { 
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegistrationPage()
                        ),
                  ); 
                      },
                      icon: const Icon(Icons.app_registration),
                      label: SizedBox(
                        child: Text("Register"),
                        width: 64,
                      )),
                  SizedBox(
                    width: 16,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()
                        ),
                  );
                      },
                      icon: const Icon(Icons.login),
                      label: SizedBox(
                        child: Text("Sign in"),
                        width: 64,
                      ))
                ],
              )),
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        "Pd",
        textScaleFactor: 6,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Colors.white),
      )),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.green),
      width: 200,
      height: 200,
    );
  }
}