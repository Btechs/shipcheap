import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shipcheap/models/product.dart';
import 'package:shipcheap/models/user.dart';
import 'package:shipcheap/models/vendor_type.dart';
import 'package:shipcheap/requests/product.request.dart';
import 'package:shipcheap/services/auth.service.dart';
import 'package:shipcheap/services/location.service.dart';
import 'package:shipcheap/view_models/base.view_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:shipcheap/translations/dialogs.i18n.dart';

class GroceryViewModel extends MyBaseViewModel {
  //
  GroceryViewModel(BuildContext context, VendorType vendorType) {
    this.viewContext = context;
    this.vendorType = vendorType;
  }

  //
  User currentUser;
  StreamSubscription currentLocationChangeStream;

  //
  ProductRequest productRequest = ProductRequest();
  RefreshController refreshController = RefreshController();
  List<Product> productPicks = [];

  void initialise() async {
    //
    if (AuthServices.authenticated()) {
      currentUser = await AuthServices.getCurrentUser(force: true);
      notifyListeners();
    }

    //listen to user location change
    currentLocationChangeStream =
        LocationService.currenctAddressSubject.stream.listen(
      (location) {
        //

        deliveryaddress.address = location.addressLine;
        deliveryaddress.latitude = location.coordinates.latitude;
        deliveryaddress.longitude = location.coordinates.longitude;
        notifyListeners();
      },
    );

    //get today picks
    getTodayPicks();
  }

  //
  dispose() {
    super.dispose();
    currentLocationChangeStream.cancel();
  }

  //
  getTodayPicks() async {
    //
    setBusyForObject(productPicks, true);
    try {
      productPicks = await productRequest.getProdcuts(
        queryParams: {
          "vendor_type_id": vendorType.id,
          "type": "best",
        },
      );
    } catch (error) {
      print("Error ==> $error");
    }
    setBusyForObject(productPicks, false);
  }
}
