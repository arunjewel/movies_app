import 'package:dio/dio.dart';

import '../../model/api_model/base_model/api_response.dart';
import '../../model/api_model/base_model/error_response.dart';
import 'network_config.dart';

class ApiConfig {
  final Dio client;
  final NetworkConfig networkConfig;

  ApiConfig({
    required this.client,
    required this.networkConfig,
  });

  Future<ApiResponse> getData({
    required String endpointUrl,
    required var formData,
  }) async {
    if (!await networkConfig.isConnected) {
      return ApiResponse.withError((Errors.networkError()));
    }
    try {
      Response result =
          await client.get(endpointUrl, queryParameters: formData);

      return ApiResponse.withSuccess(result);
    } on DioError catch (dioError) {
      return ApiResponse.withError(dioError.toString());
    } catch (e) {
      var err = Errors.unknownError(
        "Oops something went wrong",
        code: e.toString(),
      );
      return ApiResponse.withError(err);
    }
  }

  Future<ApiResponse> postData({
    required String endpointUrl,
    required var formData,
  }) async {
    if (!await networkConfig.isConnected) {
      return ApiResponse.withError((Errors.networkError()));
    }

    try {
      Response result = await client.post(endpointUrl,
          options: Options(
            contentType: Headers.textPlainContentType,
            responseType: ResponseType.plain,
            receiveDataWhenStatusError: true,
            headers: {
              "Accept": "application/json",
              "Authorization": "",
            },
          ),
          data: formData);
      print(result);
      return ApiResponse.withSuccess(result);
    } on DioError catch (dioError) {
      return ApiResponse.withError(dioError.toString());
    } catch (e) {
      var err = Errors.unknownError(
        "Oops something went wrong",
        code: e.toString(),
      );
      return ApiResponse.withError(err);
    }
  }
}
