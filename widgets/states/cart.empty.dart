import 'package:flutter/material.dart';
import 'package:shipcheap/constants/app_images.dart';
import 'package:shipcheap/widgets/states/empty.state.dart';
import 'package:shipcheap/translations/cart.i18n.dart';
import 'package:velocity_x/velocity_x.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      imageUrl: AppImages.emptyCart,
      title: "Oopps!".i18n,
      description: "Sorry, you have no product in your cart".i18n,
    ).p20();
  }
}
