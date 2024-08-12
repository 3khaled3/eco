part of 'widget_import.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).width * .4,
      width: MediaQuery.sizeOf(context).width * .4,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          ///<--------- USER IMAGE --------->///

          ClipOval(
            child: Image.asset(
              AssetsBox.userAvatar,
              fit: BoxFit.cover,
            ),
          ),

          ///<--------- CAMERA ICON BUTTON to edit image --------->///

          PositionedDirectional(
            end: 0,
            bottom: 5,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () async {},
                borderRadius: BorderRadius.circular(55555),
                child: Ink(
                  padding: const EdgeInsetsDirectional.all(8),
                  decoration: BoxDecoration(
                    color: ColorsBox.lighterPurple,
                    borderRadius: BorderRadius.circular(55555),
                  ),
                  child: const Icon(
                    Icons.camera_alt_sharp,
                    size: 22,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
