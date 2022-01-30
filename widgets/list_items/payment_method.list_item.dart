import 'package:flutter/material.dart';
import 'package:shipcheap/constants/app_colors.dart';
import 'package:shipcheap/models/payment_method.dart';
import 'package:shipcheap/utils/ui_spacer.dart';
import 'package:shipcheap/widgets/custom_image.view.dart';
import 'package:velocity_x/velocity_x.dart';

class PaymentOptionListItem extends StatelessWidget {
  const PaymentOptionListItem(
    this.paymentMethod, {
    this.selected = false,
    Key key,
    this.onSelected,
  }) : super(key: key);

  final bool selected;
  final PaymentMethod paymentMethod;
  final Function(PaymentMethod) onSelected;

  @override
  Widget build(BuildContext context) {
    return HStack(
      [
        //
        CustomImage(
          imageUrl: paymentMethod.photo,
          width: Vx.dp48,
          height: Vx.dp48,
          boxFit: BoxFit.contain,
        ).px4().py8(),
        //
        paymentMethod.name.text.medium.lg.make().expand(),
        UiSpacer.horizontalSpace(),
      ],
    )
        .box
        .roundedSM
        .border(
          color: selected
              ? AppColor.primaryColor
              : context.textTheme.bodyText1.color.withOpacity(0.20),
          width: selected ? 2 : 1,
        )
        .make()
        .onInkTap(
          () => onSelected(paymentMethod),
        );
  }
}
