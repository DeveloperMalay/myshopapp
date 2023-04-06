import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_app/core/helper/validator.dart';
import 'package:ecommerce_app/core/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'widgets/glowing_button.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late GlobalKey<FormState> _formKey;

  late TextEditingController _emailEditingController;
  late TextEditingController _passwordEditingController;
  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controller.reset();
    }
  }

  void shake() {
    if (controller.status == AnimationStatus.completed) {
      controller.reset();
      controller.forward();
    } else {
      controller.forward();
    }
  }

  @override
  void initState() {
    _formKey = GlobalKey();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _emailEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Lottie.asset('assets/login.json'),
                  AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        final sineValue = sin(4 * 2 * pi * controller.value);
                        return Transform.translate(
                          offset: Offset(sineValue * 10, 0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: 'Enter your email'),
                              validator: (value) {
                                if (value!.isEmpty == true) {
                                  return "Email id is Invalid";
                                } else if (value.toString().isValidEmail ==
                                    false) {
                                  return "Email id is Invalid";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        );
                      }),
                  AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        final sineValue = sin(4 * 2 * pi * controller.value);
                        return Transform.translate(
                          offset: Offset(sineValue * 10, 0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                errorBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'Enter your password',
                              ),
                              validator: (value) {
                                if (value?.isEmpty == true) {
                                  return "Password was Incorrect";
                                } else if (value.toString().isValidPassword ==
                                    false) {
                                  return "Password was Incorrect";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ),
                        );
                      }),
                  const SizedBox(height: 60),
                  Center(
                    child: GlowingLoginButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          AutoRouter.of(context).push( HomeRoute());
                        } else {
                          shake();
                        }
                      },
                      text: 'Login',
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
