part of 'widget_import.dart';

class PromoCodeTextField extends StatelessWidget {
  const PromoCodeTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        padding: const EdgeInsets.all(8),

        ///<--------- PROMO CODE TEXT field decoration --------->///
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: TextField(
          decoration: InputDecoration(
            ///<--------- PROMO CODE TEXT field Suffix Icon --------->///

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

            ///<--------- PROMO CODE TEXT field prefix Icon --------->///

            prefixIcon: const Icon(Icons.sell_outlined),
            border: InputBorder.none,

            /// <--------- PROMO CODE TEXT field hint --------->///
            hintText: 'Enter Coupon Code',
            hintStyle: StylesBox.regular12,
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
