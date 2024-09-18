import 'package:eco/features/cart/view/empty_cart.dart';
import 'package:eco/utils/box_styles.dart';
import 'package:eco/utils/widget/back_button.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  static const String routeName = '/cart_view';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              /// <--------- APP BAR ---------> ///
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(),
                  Text(
                    "Cart",
                    style: StylesBox.bold16,
                  ),
                  SizedBox(width: 48)
                ],
              ),

              /// <--------- CART BODY ---------> ///

              Expanded(child: EmptyCart()),
            ],
          ),
        ),
      ),
    );
  }
}
