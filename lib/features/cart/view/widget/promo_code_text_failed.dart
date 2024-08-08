part of 'widget_import.dart';

class PromoCodeTextFailed extends StatelessWidget {
  const PromoCodeTextFailed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: TextField(
          decoration: InputDecoration(
            suffixIcon: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(555),
              child: SizedBox(
                width: 40,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(555),
                  child: Center(
                    child: Ink(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: ColorsBox.lighterPurple,
                        borderRadius: BorderRadius.circular(555),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: ColorsBox.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            prefixIcon: const Icon(Icons.sell_outlined),
            border: InputBorder.none,
            hintText: 'Enter Coupon Code',
            hintStyle: BoxStyles.regular12,
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
