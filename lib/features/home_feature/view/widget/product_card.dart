part of 'widget_import.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 280,
            width: 165,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// <---- product image ---->///
                const _ProductImage(),

                /// <---- product name ---->///
                const Padding(
                  padding:
                      EdgeInsetsDirectional.only(top: 8, bottom: 8, start: 4),
                  child: Text('Product Name', style: BoxStyles.medium12),
                ),

                /// <---- product price ---->///
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      /// <---- product current price ---->///
                      const Text(' \$200', style: BoxStyles.bold12),
                      const SizedBox(width: 8),

                      /// <---- product old price ---->///
                      Text(
                        ' \$200',
                        style: BoxStyles.medium12.copyWith(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.grey,
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),

                      /// <---- product _Rating ---->///
                      const _Rating(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        /// <---- favorite button ---->///
        const _FavoriteButton(),
      ],
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Image.asset(
        AssetsBox.userAvatar,
        height: 205,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _Rating extends StatelessWidget {
  const _Rating();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: BoxColors.lighterPurple,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Text("4.5", style: BoxStyles.bold12.copyWith(color: BoxColors.white)),
          const SizedBox(width: 4),
          const Icon(
            Icons.star_outline_rounded,
            color: BoxColors.white,
          ),
        ],
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton();

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      end: 8,
      top: 8,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(5),
          child: const Icon(
            Icons.favorite_rounded,
            color: Colors.red,
            size: 16,
          ),
        ),
      ),
    );
  }
}
