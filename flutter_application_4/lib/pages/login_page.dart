import 'package:flutter/material.dart';
import 'package:flutter_application_4/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static const routerName = "/login";
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _username = new TextEditingController();
    TextEditingController _password = new TextEditingController();
    void handleSubmit() {
      var email = _username.text;
      var password = _password.text;
      if (email.isNotEmpty && password.isNotEmpty) {
        Provider.of<AuthProvider>(context, listen: false)
            .login(email, password);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _username,
              decoration: InputDecoration(
                label: Text("username"),
              ),
            ),
            TextField(
              controller: _password,
              decoration: InputDecoration(
                label: Text("password"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: handleSubmit, child: Text("Login")))
          ],
        ),
      ),
    );
  }
}
