part of 'widget_import.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// <---- product image ---->///

            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: Image.asset(AssetsBox.userAvatar,
                    height: 64, width: 64, fit: BoxFit.cover)),
            const SizedBox(
              width: 8,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// <---- product name ---->///

                Text(
                  "Product name",
                  style: BoxStyles.bold16,
                ),
                SizedBox(height: 8),

                /// <---- product details ---->///

                Row(
                  children: [
                    _ProductDetails(title: "Size", data: " -S"),
                    SizedBox(width: 16),
                    _ProductDetails(title: "color", data: " -Red")
                  ],
                )
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ///<----- price ----->///

                const Text(" \$100", style: BoxStyles.bold12),
                const SizedBox(
                  height: 8,
                ),

                /// <----- quantity ----->///

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// <----- add  icon ----->///

                    _CartIconButton(
                      icon: Icons.add,
                      onTap: () {},
                    ),

                    /// <----- quantity ----->///
                    const Center(
                      child: Text(
                        "   1   ",
                        style: BoxStyles.regular12,
                      ),
                    ),

                    /// <----- remove icon ----->///

                    _CartIconButton(
                      icon: Icons.remove,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({required this.title, required this.data});
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: BoxStyles.regular12.copyWith(
            color: Colors.grey,
          ),
        ),
        Text(
          data,
          style: BoxStyles.bold12,
        ),
      ],
    );
  }
}

class _CartIconButton extends StatelessWidget {
  const _CartIconButton({required this.icon, required this.onTap});
  final IconData icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5555),
      onTap: onTap,
      child: Ink(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5555),
          color: ColorsBox.lighterPurple,
        ),
        child: SizedBox(
          child: Icon(
            icon,
            size: 18,
            color: ColorsBox.white,
          ),
        ),
      ),
    );
  }
}
