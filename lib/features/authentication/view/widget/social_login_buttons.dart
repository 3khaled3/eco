part of 'widget_import.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialLoginButton(
          onTap: () async {
            await LoginCubit().loginWithGoogle();
          },
          icon: Icon(EvaIcons.google, color: Color(0xffd62d20)),
          title: "Continue with Google",
        ),
        const SizedBox(height: 10),
        SocialLoginButton(
          onTap: () {},
          icon: Icon(EvaIcons.facebook, color: Colors.blue.shade800),
          title: "Continue with Facebook",
        ),
      ],
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});

  final Widget icon;
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomOutlineButton(
        icon: Padding(
          padding: const EdgeInsetsDirectional.only(end: 10),
          child: icon,
        ),
        title: title,
        titleStyle: StylesBox.semibold16,
        onTap: onTap,
      ),
    );
  }
}
