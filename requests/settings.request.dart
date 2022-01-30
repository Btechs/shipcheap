import 'package:shipcheap/constants/api.dart';
import 'package:shipcheap/models/api_response.dart';
import 'package:shipcheap/services/http.service.dart';

class SettingsRequest extends HttpService {
  //
  Future<ApiResponse> appSettings() async {
    final apiResult = await get(Api.appSettings);
    return ApiResponse.fromResponse(apiResult);
  }
}
