import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:provider/provider.dart";
import "package:provider_tutorial/screens/auth/auth_provider.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    ValueNotifier<bool> passwordTogle = ValueNotifier<bool>(false);
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "email",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
              valueListenable: passwordTogle,
              builder: (context, value, child) {
                return TextFormField(
                  controller: passwordController,
                  obscureText: auth.togle,
                  decoration: InputDecoration(
                      hintText: "password",
                      suffix: InkWell(
                        onTap: () {
                          auth.visibity(auth.togle);
                          print(auth.togle);
                        },
                        child: Icon(auth.togle
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              // we can use a simple  auth.getLogin(emailController.text.toString(),
              //       passwordController.text.toString());
              // folloewing functionality done by me
              onTap: () async {
                bool res = await auth.getLogin(emailController.text.toString(),
                    passwordController.text.toString());
                print(" final response " + res.toString());
              },
              child: Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: (auth.loading)
                          ? const CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            )
                          : Text("Login"))),
            )
          ],
        ),
      ),
    );
  }
}
