part of 'widget_import.dart';

class BuildLoginText extends StatelessWidget {
  const BuildLoginText({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: StylesBox.regular16.copyWith(
            color: Colors.grey[600],
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginView()),
            );
          },
          child: Text(
            "Sign in",
            style: StylesBox.bold16.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
