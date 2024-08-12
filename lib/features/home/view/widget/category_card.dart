part of 'widget_import.dart';
class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: WidgetStateProperty.all<OutlinedBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(100),
                bottomStart: Radius.circular(100),
                bottomEnd: Radius.circular(16),
                topEnd: Radius.circular(16),
              ),
            ),
          ),
          padding: const WidgetStatePropertyAll(EdgeInsets.zero),
        ),
        child: Ink(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(100),
              bottomStart: Radius.circular(100),
              bottomEnd: Radius.circular(16),
              topEnd: Radius.circular(16),
            ),
          ),
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  AssetsBox.userAvatar,
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                "Categories",
                style: StylesBox.bold16
                    .copyWith(color: Theme.of(context).colorScheme.outline),
              ),
              const Spacer(),
              Icon(Icons.chevron_right_rounded,
                  color: Theme.of(context).colorScheme.outline),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}
