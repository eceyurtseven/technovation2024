import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';
import 'package:technovation2024/constants.dart';
import 'package:technovation2024/sign_in.dart';

class RegistrationPage extends ConsumerStatefulWidget {
  const RegistrationPage({super.key});

  @override
    ConsumerState<ConsumerStatefulWidget> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends ConsumerState<RegistrationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  bool creatingTeam = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signUp() async {
    try{
      setState(() {
        _isLoading = true;
      });
      await supabase.auth.signUp(
        email: _emailController.text,
        password: _passwordController.text,
        data: {
          "name": _nameController.text.toLowerCase(),
        }
      );
      setState(() {
        _isLoading = false;
      });
      final s = ScaffoldMessenger.of(context);
        s.showMaterialBanner(MaterialBanner(
          leading: const Icon(Icons.mail),
          content: const Text("Please check your email for a verification link!"), 
          actions: [
            TextButton(
              onPressed: () {
                _navigateToLoginPage();
                s.hideCurrentMaterialBanner();
              },
              child: const Text("Ugh, really?"),
              ),
          ],
        ),);
    } catch (e) {
      print('Exception when signing in: $e');
      final s = ScaffoldMessenger.of(context);
        s.showMaterialBanner(MaterialBanner(
          leading: const Icon(Icons.dangerous_outlined),
          content: const Text("Please fill out all fields!"), 
          actions: [
            TextButton(
              onPressed: () {
                s.hideCurrentMaterialBanner();
              },
              child: const Text("Why?!"),
              ),
          ],
        ),);
    }
  }

  void _navigateToLoginPage(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const SignInPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
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
                    controller: _nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Please enter your name",
                      labelText: "Name",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    enableSuggestions: false,
                    autocorrect: false,
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
            ElevatedButton(
                onPressed: () async {
                  var s = ScaffoldMessenger.of(context);
                  try {
                    _signUp();
                  } on GrpcError catch (e) {
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
                child: const Text("Register"))
          ],
        )),
      ),
    );
  }

}