import 'package:eco/features/cart/view/widget/widget_import.dart';
import 'package:eco/utils/box_styles.dart';
import 'package:flutter/material.dart';

class CartBody extends StatelessWidget {
  const CartBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),

        /// <--------- CLEAR all  CART BUTTON ---------> ///

        Align(
          alignment: AlignmentDirectional.topEnd,
          child: TextButton(
            onPressed: () {},
            child: const Text("Clear cart", style: StylesBox.bold16),
          ),
        ),

        /// <--------- CART ITEMS Builder ---------> ///

        Expanded(
          child: Material(
            child: ListView.separated(
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  ///<--------- CART ITEM ---------> ///

                  return const CartItem();
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemCount: 10),
          ),
        ),

        /// <--------- INVOICE DETAILS ---------> ///

        const InvoiceDetails(title: "Subtotal", data: "\$ 100.00"),
        const InvoiceDetails(title: "Shipping Cost", data: "\$ 100.00"),
        const InvoiceDetails(title: " Tax", data: "\$ 100.00"),
        const InvoiceDetails(title: "Total", data: "\$ 100.00"),
        const PromoCodeTextField()
      ],
    );
  }
}
