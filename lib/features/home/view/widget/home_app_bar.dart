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
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(99999),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(999999),
            child: CachedNetworkImage(
              imageUrl: FirebaseAuth.instance.currentUser?.photoURL ??
                  AssetsBox.userAvatar,
              height: 40,
              width: 40,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Image.asset(
                AssetsBox.userAvatar,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),

        10.pw,

        ///<----- user name ----->///
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "welcome ${FirebaseAuth.instance.currentUser!.displayName ?? " "}",
              style: StylesBox.bold16,
            ),
            const Text(
              "start Shopping",
              style: StylesBox.regular16,
            ),
          ],
        ),
        const Spacer(),

        /// <---- team info button ---->///
        InkWell(
          onTap: () {
            // todo add team info page
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
              Icons.info_outline_rounded,
              color: ColorsBox.white,
            ),
          ),
        ),
      ],
    );
  }
}
