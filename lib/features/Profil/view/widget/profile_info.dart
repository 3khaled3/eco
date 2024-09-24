part of 'widget_import.dart';

class UserInformation extends StatefulWidget {
  final UserModel user;
  const UserInformation({super.key, required this.user});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///<--------- USER NAME --------->///
          Text(
            widget.user.username,
            style: StylesBox.semibold18,
          ),

          ///<--------- USER phone --------->///
          Text(
            widget.user.email,
            style: StylesBox.medium16,
          ),
        ],
      ),
    );
  }
}
