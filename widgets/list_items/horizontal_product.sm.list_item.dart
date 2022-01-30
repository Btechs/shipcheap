import 'package:flutter/material.dart';
import 'package:shipcheap/constants/app_colors.dart';
import 'package:shipcheap/models/product.dart';
import 'package:shipcheap/constants/app_strings.dart';
import 'package:shipcheap/utils/utils.dart';
import 'package:shipcheap/widgets/custom_image.view.dart';
import 'package:velocity_x/velocity_x.dart';

class SmallHorizontalProductListItem extends StatelessWidget {
  //
  const SmallHorizontalProductListItem(this.product,
      {this.onPressed, @required this.qtyUpdated, Key key})
      : super(key: key);

  //
  final Product product;
  final Function(Product) onPressed;
  final Function(Product, int) qtyUpdated;
  @override
  Widget build(BuildContext context) {
    //
    final currencySymbol = AppStrings.currencySymbol;

    //
    return Stack(
      children: [
        HStack(
          [
            //
            Hero(
              tag: product.heroTag,
              child: CustomImage(imageUrl: product.photo)
                  // .wh(Vx.dp40, Vx.dp40)
                  .w(context.percentWidth * 18)
                  .hFull(context)
                  .box
                  .clip(Clip.antiAlias)
                  .withRounded(value: 5)
                  .make(),
            ),

            //Details
            VStack(
              [
                //name
                product.name.text.sm.medium
                    .maxLines(2)
                    .overflow(TextOverflow.ellipsis)
                    .make(),
                //description
                product.description.text
                    .minFontSize(6)
                    .size(8)
                    .coolGray500
                    .maxLines(1)
                    .overflow(TextOverflow.ellipsis)
                    .make(),
                //price
                HStack(
                  [
                    currencySymbol.text.xs.make(),
                    product.sellPrice.numCurrency.text.sm.medium.make(),
                  ],
                  crossAlignment: CrossAxisAlignment.end,
                ),
              ],
            ).px12().expand(),
          ],
        )
            .onInkTap(() => onPressed(product))
            .box
            .p4
            .withRounded(value: 5)
            .color(context.cardColor)
            .outerShadow
            .makeCentered()
            .p8()
            .w(context.percentWidth * 52),

        //price tag
        Positioned(
          left: !Utils.isArabic ? 10 : null,
          right: !Utils.isArabic ? null : 10,
          top: 8,
          child: Visibility(
            visible: product.showDiscount,
            child: VxBox(
              child: "-${product.discountPercentage}%"
                  .text
                  .xs
                  .semiBold
                  .white
                  .make(),
            ).p4.bottomRounded(value: 5).color(AppColor.primaryColor).make(),
          ),
        ),
      ],
    );
  }
}
