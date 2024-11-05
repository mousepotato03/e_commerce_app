import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../dto/common/response_wrapper/response_wrapper.dart';

part 'user.api.g.dart';

const String _baseUrl = "https://createcustomtoken-ab643okp7a-uc.a.run.app";

@RestApi(baseUrl: _baseUrl)
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  @POST('/createCustomToken')
  Future<ResponseWrapper<String>> getCustomToken({
    @Body() required Map<String,dynamic> params,
});
}
