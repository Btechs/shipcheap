import 'package:shipcheap/constants/api.dart';
import 'package:shipcheap/models/api_response.dart';
import 'package:shipcheap/models/banner.dart';
import 'package:shipcheap/services/http.service.dart';

class BannerRequest extends HttpService {
  //
  Future<List<Banner>> banners({int vendorTypeId}) async {
    final apiResult = await get(
      Api.banners,
      queryParameters: {
        "vendor_type_id": vendorTypeId,
      },
    );

    final apiResponse = ApiResponse.fromResponse(apiResult);

    if (apiResponse.allGood) {
      return apiResponse.data
          .map((jsonObject) => Banner.fromJSON(jsonObject))
          .toList();
    } else {
      throw apiResponse.message;
    }
  }
}
