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
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10),

        ///<----- user name ----->///
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              GetTranslation.of(context).welcome,
              style: BoxStyles.bold16,
            ),
            Text(
              GetTranslation.of(context).startShopping,
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
              color: ColorsBox.lighterPurple,
              borderRadius: BorderRadius.circular(200),
            ),
            child: const Icon(
              Icons.search,
              color: ColorsBox.white,
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
              color: ColorsBox.lighterPurple,
              borderRadius: BorderRadius.circular(200),
            ),
            child: const Icon(
              Icons.search,
              color: ColorsBox.white,
            ),
          ),
        ),
      ],
    );
  }
}
