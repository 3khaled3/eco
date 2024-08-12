part of 'widget_import.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(16),
            child: Ink(
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
                   Padding(
                    padding:
                        EdgeInsetsDirectional.only(top: 8, bottom: 8, start: 4),
                    child: Text(GetTranslation.of(context).productName, style: StylesBox.medium12),
                  ),

                  /// <---- product price ---->///
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        /// <---- product current price ---->///
                        const Text(' \$200', style: StylesBox.bold12),
                        const SizedBox(width: 8),

                        /// <---- product old price ---->///
                        Text(
                          ' \$200',
                          style: StylesBox.medium12.copyWith(
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
        ),

        /// <---- favorite button ---->///
        const _FavoriteButton(),
      ],
    );
  }
}

/// <---- product image ---->///
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

/// <---- rating ---->///
class _Rating extends StatelessWidget {
  const _Rating();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsBox.lighterPurple,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Text("4.5", style: StylesBox.bold12.copyWith(color: ColorsBox.white)),
          const SizedBox(width: 4),
          const Icon(
            Icons.star_outline_rounded,
            color: ColorsBox.white,
          ),
        ],
      ),
    );
  }
}

/// <---- favorite button ---->///
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
            //todo: used to un favorite
            // Icons.favorite_outline_rounded,
            // color: Colors.black,
            size: 16,
          ),
        ),
      ),
    );
  }
}
