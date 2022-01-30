import 'package:flutter/material.dart';
import 'package:shipcheap/constants/app_images.dart';
import 'package:shipcheap/widgets/states/empty.state.dart';
import 'package:shipcheap/translations/order.i18n.dart';
import 'package:velocity_x/velocity_x.dart';

class EmptyOrder extends StatelessWidget {
  const EmptyOrder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      imageUrl: AppImages.emptyCart,
      title: "No Order".i18n,
      description: "When you place an order, they will appear here".i18n,
    ).p20();
  }
}
