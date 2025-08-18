import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
      if (context.mounted) {
        await Navigator.pushNamed(context, MyRoutes.homeRoute);
        setState(() {
          changeButton = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Material(
      color: context.canvasColor, // creamColor (light), darkCreamColor (dark)
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/login.png", fit: BoxFit.cover),
              const SizedBox(height: 20.0),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? MyTheme.white : MyTheme.darkBluishColor,
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter UserName",
                        labelText: "UserName",
                        hintStyle: TextStyle(
                          color: isDarkMode
                              // ignore: deprecated_member_use
                              ? MyTheme.white.withOpacity(0.8)
                              : Colors.black54,
                        ),
                        labelStyle: TextStyle(
                          color: isDarkMode ? MyTheme.white : Colors.black87,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "UserName cannot be empty";
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
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                        hintStyle: TextStyle(
                          color: isDarkMode
                              // ignore: deprecated_member_use
                              ? MyTheme.white.withOpacity(0.8)
                              : Colors.black54,
                        ),
                        labelStyle: TextStyle(
                          color: isDarkMode ? MyTheme.white : Colors.black87,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 8) {
                          return "Password should be at least 8 characters";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: changeButton ? 45 : 130,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () => moveToHome(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDarkMode
                              ? MyTheme.lightBluishColor
                              : MyTheme.darkBluishColor,
                          foregroundColor: MyTheme.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              changeButton ? 45 : 8,
                            ),
                          ),
                          minimumSize: const Size(45, 45),
                        ),
                        child: changeButton
                            ? const Icon(Icons.done)
                            : const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
