import 'package:eco/features/authentication/view_model/cubit/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:eco/utils/widget/custom_primary_button.dart';
import 'package:eco/utils/box_styles.dart';
import 'package:eco/utils/colors_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/function/validation_function.dart';
import '../widget/widget_import.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static const String routeName = '/register_view';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _password = '';
  String _email = '';

  final RegisterCubit registerCubit = RegisterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RegisterCubit, RegisterState>(
        bloc: registerCubit,
        listener: (context, state) {
          if (state is RegisterSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("verify email your email and try login"),
                ),
              );
            });
          }
          if (state is RegisterFailure) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Error: ${state.message}"),
              ));
            });
          }
        },
        builder: (context, state) {
          if (state is RegisterLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SafeArea(
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
                      const InputLabel(text: "Enter your email"),
                      const SizedBox(height: 10),
                      LoginTextField(
                        hintText: 'Enter your email',
                        validator: validateEmail,
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
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
                      const BuildLoginText(),
                      const SizedBox(height: 10),
                      Text(
                        "Or",
                        style: StylesBox.bold16.copyWith(
                          color: Colors.grey[600],
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
          );
        },
      ),
    );
  }

  Widget _buildPrimaryButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomPrimaryButton(
        title: "Register",
        titleStyle: StylesBox.bold16.copyWith(color: ColorsBox.white),
        onTap: () async {
          if (_formKey.currentState?.validate() ?? false) {
            await registerCubit.registerWithEmail(_email, _password);
          }
        },
      ),
    );
  }
}
