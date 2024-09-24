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
            color: Theme.of(context).colorScheme.secondaryFixed,
          ),
        ),
        TextButton(
          onPressed: () {
            context.go(AppRoutes.kLoginRoute);
          },
          child: Text(
            "Sign in",
            style: StylesBox.bold16.copyWith(
              color: Theme.of(context).colorScheme.secondaryFixed,
            ),
          ),
        ),
      ],
    );
  }
}
