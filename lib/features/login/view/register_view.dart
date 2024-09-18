import 'package:flutter/material.dart';
import 'package:eco/utils/widget/custom_primary_button.dart';
import 'package:eco/utils/box_styles.dart';
import 'package:eco/utils/colors_box.dart';

import '../view_model/function/validation_function.dart';
import 'widget/widget_import.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static const String routeName = '/register_view';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text("Register", style: StylesBox.bold32),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .05,
                  ),
                  const InputLabel(text: "Enter your user name"),
                  const SizedBox(height: 10),
                  LoginTextField(
                    hintText: 'Enter your user name',
                    validator: validateUserName,
                    onChanged: (value) {
                      print('User name changed: $value');
                    },
                  ),
                  const SizedBox(height: 18),
                  const InputLabel(text: "Enter your email"),
                  const SizedBox(height: 10),
                  LoginTextField(
                    hintText: 'Enter your email',
                    validator: validateEmail,
                    onChanged: (value) {
                      print('Email changed: $value');
                    },
                  ),
                  const SizedBox(height: 18),
                  const InputLabel(text: "Enter your password"),
                  const SizedBox(height: 10),
                  LoginTextField(
                    hintText: 'Enter your password',
                    isPassword: true,
                    validator: validatePassword,
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                      print('Password changed: $value');
                    },
                  ),
                  const SizedBox(height: 18),
                  const InputLabel(text: "Re-Enter your password"),
                  const SizedBox(height: 10),
                  LoginTextField(
                    hintText: 'Re-Enter your password',
                    isPassword: true,
                    validator: (value) =>
                        validatePasswordConfirmation(value, _password),
                    onChanged: (value) {
                      print('Password confirmation changed: $value');
                    },
                  ),
                  const SizedBox(height: 10),
                  _buildPrimaryButton(context),
                  const SizedBox(height: 10),
                  Text(
                    "Don’t have an account? Sign in",
                    style: StylesBox.regular16.copyWith(
                      color: Theme.of(context).colorScheme.secondaryFixed,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Or",
                    style: StylesBox.bold16.copyWith(
                      color: Theme.of(context).colorScheme.secondaryFixed,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SocialLoginButtons(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPrimaryButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomPrimaryButton(
        title: "Register",
        titleStyle: StylesBox.bold16.copyWith(color: ColorsBox.white),
        onTap: () {
          if (_formKey.currentState?.validate() ?? false) {
            // Handle successful validation with BLoC or other state management
          }
        },
      ),
    );
  }
}
