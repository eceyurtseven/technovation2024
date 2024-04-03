import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';
import 'package:technovation2024/constants.dart';
import 'package:technovation2024/home.dart';


class SignInPage extends ConsumerStatefulWidget {
  static String path = "/sign-in";

  const SignInPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
        _navigateToHome();
    } catch (e) {
      print('Exception when signing in: $e');
      final s = ScaffoldMessenger.of(context);
        s.showMaterialBanner(MaterialBanner(
          leading: const Icon(Icons.dangerous_outlined),
          content: const Text("Incorrect email or password! Please try again."), 
          actions: [
            TextButton(
              onPressed: () {
                s.hideCurrentMaterialBanner();
              },
              child: const Text("No!"),
              ),
          ],
        ),);
    }
  }
  
  void _navigateToHome() {
    Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(builder: (_) => const HomePage()), 
      (route) => false
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign in")),
      body: Center(
          child: SingleChildScrollView(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Form(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: _emailController,
                  enableSuggestions: false,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Please enter your email",
                    labelText: "Email",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: _passwordController,
                  autocorrect: false,
                  obscureText: true,
                  enableSuggestions: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Please enter your password",
                    labelText: "Password",
                  ),
                ),
              ),
            ],
          )),
          TextButton(
              onPressed: () {
                /*final router = ref.watch(routerProvider);
                router.push(PasswordRecoveryPage.path); */
              },
              child: const Text("Forgot your password?")),
          ElevatedButton(
              onPressed: () async {
                var s = ScaffoldMessenger.of(context);
                try {
                  _signIn();
                }on GrpcError catch (e) {
                  s.showMaterialBanner(MaterialBanner(
                    content: Text("Error: ${e.message} (${e.codeName})"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          s.hideCurrentMaterialBanner();
                        },
                        child: const Text('Dismiss'),
                      ),
                    ],
                  ));
                }
              },
              child: const Text("Sign in"))
        ],
      ))),
    );
  }
}
