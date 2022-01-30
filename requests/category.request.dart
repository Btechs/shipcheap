import 'package:shipcheap/constants/api.dart';
import 'package:shipcheap/models/api_response.dart';
import 'package:shipcheap/models/category.dart';
import 'package:shipcheap/services/http.service.dart';

class CategoryRequest extends HttpService {
  //
  Future<List<Category>> categories({
    int vendorTypeId,
    int page = 0,
  }) async {
    final apiResult = await get(
      //
      Api.categories,
      queryParameters: {
        "vendor_type_id": vendorTypeId,
        "page": page,
      },
    );

    final apiResponse = ApiResponse.fromResponse(apiResult);

    if (apiResponse.allGood) {
      return apiResponse.data
          .map((jsonObject) => Category.fromJson(jsonObject))
          .toList();
    } else {
      throw apiResponse.message;
    }
  }
}
