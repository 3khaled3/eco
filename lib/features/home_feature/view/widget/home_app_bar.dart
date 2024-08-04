part of 'widget_import.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// <---- user image ---->///
        ClipOval(
          child: Image.asset(
            AssetsBox.userAvatar,
            height: 40,
            width: 40,
          ),
        ),
        const SizedBox(width: 10),

        ///<----- user name ----->///
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, omar',
              style: BoxStyles.bold16,
            ),
            Text(
              'start Shopping now',
              style: BoxStyles.regular16,
            ),
          ],
        ),
        const Spacer(),

        /// <---- search button ---->///
        InkWell(
          onTap: () {
            BlocProvider.of<SettingsCubit>(context).toggleTheme();
          },
          borderRadius: BorderRadius.circular(200),
          child: Ink(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: BoxColors.lighterPurple,
              borderRadius: BorderRadius.circular(200),
            ),
            child: const Icon(
              Icons.search,
              color: BoxColors.white,
            ),
          ),
        ),
        //todo!! : used to test ui while developing " needed to remove"
        InkWell(
          onTap: () {
            BlocProvider.of<SettingsCubit>(context).toggleLanguage();
          },
          borderRadius: BorderRadius.circular(200),
          child: Ink(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: BoxColors.lighterPurple,
              borderRadius: BorderRadius.circular(200),
            ),
            child: const Icon(
              Icons.search,
              color: BoxColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
