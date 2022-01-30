import 'package:shipcheap/constants/api.dart';
import 'package:shipcheap/models/api_response.dart';
import 'package:shipcheap/models/coupon.dart';
import 'package:shipcheap/services/http.service.dart';

class CartRequest extends HttpService {
  //
  Future<Coupon> fetchCoupon(String code) async {
    final apiResult = await get("${Api.coupons}/$code");
    final apiResponse = ApiResponse.fromResponse(apiResult);
    if (apiResponse.allGood) {
      return Coupon.fromJson(apiResponse.body);
    } else {
      throw apiResponse.message;
    }
  }
}
