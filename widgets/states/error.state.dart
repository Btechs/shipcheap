import 'package:flutter/material.dart';
import 'package:shipcheap/constants/app_images.dart';
import 'package:shipcheap/widgets/states/empty.state.dart';
import 'package:shipcheap/translations/general.i18n.dart';
import 'package:velocity_x/velocity_x.dart';

class LoadingError extends StatelessWidget {
  const LoadingError({this.onrefresh, Key key}) : super(key: key);

  final Function onrefresh;
  @override
  Widget build(BuildContext context) {
    return EmptyState(
      imageUrl: AppImages.error,
      showAction: true,
      actionPressed: onrefresh,
      actionText: "Retry".i18n,
      title: "An error occured".i18n,
      description:
          "There was an error while processing your request. Please try again"
              .i18n,
    ).p20();
  }
}
