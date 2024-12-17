import 'package:eco/features/authentication/view_model/cubit/forgetPassword_cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eco/utils/box_styles.dart';
import 'package:eco/utils/widget/custom_primary_button.dart';
import '../../view_model/function/validation_function.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);
  static const String routeName = 'forget_password_view';

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String email = '';
    ForgetPasswordCubit forgetPasswordCubit = ForgetPasswordCubit();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        bloc: forgetPasswordCubit,
        listener: (context, state) {
          if (state is ForgetPasswordError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            });
          }

          if (state is ForgetPasswordSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Password reset email sent!"),
                ),
              );
              Navigator.of(context).pop();
            });
          }
        },
        builder: (context, state) {
          if (state is ForgetPasswordLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Reset Password",
                      style: StylesBox.bold32,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Enter your email address and we'll send you a link to reset your password.",
                      style: StylesBox.regular16,
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(),
                      ),
                      validator: validateEmail,
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: CustomPrimaryButton(
                        title: "Reset Password",
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                            forgetPasswordCubit.forgetPassword(email);
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (state is ForgetPasswordError)
                      Text(
                        state.error,
                        style: const TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
