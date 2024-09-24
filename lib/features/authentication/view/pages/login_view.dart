import 'package:eco/features/authentication/view_model/cubit/login_cubit/login_cubit.dart';
import 'package:eco/go_router.dart';
import 'package:eco/utils/Settings_state.dart';
import 'package:eco/utils/widget/custom_primary_button.dart';
import 'package:eco/utils/box_styles.dart';
import 'package:eco/utils/colors_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../view_model/function/validation_function.dart';
import '../widget/widget_import.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = '/login_view';

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String email = '';
    String password = '';

    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          if (state is LoginLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is LoginError) {
            // Schedule a post-frame callback to show the SnackBar
            WidgetsBinding.instance.addPostFrameCallback((_) {
              print("eeeerorr: ${state.error}");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            });
          }

          if (state is LoginSuccess) {
            // Navigate to the home route
            BlocProvider.of<SettingsCubit>(context).setUser(state.user);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Login Successful"),
                ),
              );
              context.go(AppRoutes.kHomeRoute);
            });
          }

          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "Login",
                        style: StylesBox.bold32,
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .1,
                      ),
                      const InputLabel(text: "Enter your email"),
                      const SizedBox(height: 10),
                      LoginTextField(
                        hintText: 'Enter your email',
                        validator: validateEmail,
                        onChanged: (value) {
                          email = value;
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
                          password = value;
                        },
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot password?",
                            style: StylesBox.regular16.copyWith(
                              color:
                                  Theme.of(context).colorScheme.secondaryFixed,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: CustomPrimaryButton(
                          title: "Login",
                          titleStyle:
                              StylesBox.bold16.copyWith(color: ColorsBox.white),
                          onTap: () {
                            if (formKey.currentState?.validate() ?? false) {
                              BlocProvider.of<LoginCubit>(context)
                                  .loginWithEmail(email, password);
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      const BuildRegisterText(),
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
                      TextButton(
                        onPressed: () {
                          context.go(AppRoutes.kHomeRoute);
                        },
                        child: Text(
                          "Continue as Guest",
                          style: StylesBox.bold16.copyWith(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.secondaryFixed,
                          ),
                        ),
                      ),
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
}
