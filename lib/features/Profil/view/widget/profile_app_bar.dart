part of 'widget_import.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 42),
        const Text(
          "My profile",
          style: StylesBox.semibold18,
        ),

        ///<--------- LOGOUT BUTTON --------->///
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.logout_outlined,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
