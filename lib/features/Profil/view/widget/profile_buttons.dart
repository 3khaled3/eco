part of 'widget_import.dart';

///Custom Profile Buttons
class ProfileButtons extends StatelessWidget {
  final String title;
  final String supTitle;
  final VoidCallback onPressed;

  const ProfileButtons({
    super.key,
    required this.title,
    required this.supTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    
    return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: ListTile(
            ///<--------- button title --------->///

            title: Text(
              title,
              style: StylesBox.semibold16,
            ),

            ///<--------- button SubTitle --------->///
            subtitle: Text(
              supTitle,
            ),
            subtitleTextStyle: StylesBox.regular12.copyWith(
              color: SettingsCubit().isDarkTheme()
                  ? ColorsBox.white50
                  : ColorsBox.black50,
            ),

            ///<--------- end Icon --------->///
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: SettingsCubit().isDarkTheme()
                  ? ColorsBox.white50
                  : ColorsBox.black50,
            ),
          ),
        ));
  }
}
