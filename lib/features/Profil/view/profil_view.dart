import 'package:eco/utils/Settings_state.dart';
import 'package:eco/utils/box_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widget/widget_import.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileAppBar(onPressed: () async {}),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ///<--------- USER INFORMATION --------->///
                  const ProfileImage(),
                  const UserInformation(),

                  ///<--------- SETTINGS buttons to change theme --------->///
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///<--------- Dark Mode text --------->///

                        const Text(
                          "Dark Mode",
                          style: StylesBox.semibold16,
                        ),

                        ///<--------- Dark Mode Switch --------->///

                        Switch(
                          value: context.watch<SettingsCubit>().isDarkTheme(),
                          onChanged: (value) {
                            SettingsCubit().toggleTheme();
                          },
                        ),
                      ],
                    ),
                  ),

                  ///<--------- my orders buttons --------->///

                  ProfileButtons(
                      title: "My orders",
                      supTitle: "Already have 12 orders",
                      onPressed: () {}),

                  ///<--------- addresses buttons --------->///

                  ProfileButtons(
                      title: "Shipping addresses",
                      supTitle: "3 ddresses",
                      onPressed: () {}),

                  ///<--------- payment methods buttons --------->///

                  ProfileButtons(
                      title: "Payment methods",
                      supTitle: "Visa  **34",
                      onPressed: () {}),

                  ///<--------- my reviews buttons --------->///

                  ProfileButtons(
                      title: "My reviews",
                      supTitle: "Reviews for 4 items",
                      onPressed: () {}),

                  ///<--------- settings buttons --------->///

                  ProfileButtons(
                      title: "Settings",
                      supTitle: " password & UserName",
                      onPressed: () {
                        // GoRouter.of(context).push(AppRouter.kSettingsView);
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
