part of 'widget_import.dart';

class UserInformation extends StatefulWidget {
  ///Custom Profile Information
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///<--------- USER NAME --------->///
          Text(
            "Khaled",
            style: StylesBox.semibold18,
          ),

          ///<--------- USER phone --------->///
          Text(
            "ss",
            style: StylesBox.medium16,
          ),
        ],
      ),
    );
  }
}
