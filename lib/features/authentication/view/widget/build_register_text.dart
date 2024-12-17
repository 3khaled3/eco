part of 'widget_import.dart';

class BuildRegisterText extends StatelessWidget {
  const BuildRegisterText({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: StylesBox.regular16.copyWith(
            color: Colors.grey[600],
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterView()),
            );
          },
          child: Text(
            "Sign up",
            style: StylesBox.bold16.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
