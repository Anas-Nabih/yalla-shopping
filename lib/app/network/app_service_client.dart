
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:yalla_shopping/app/api.dart';
import 'package:yalla_shopping/data/responses/base_response.dart';
part 'app_service_client.g.dart';

@RestApi(baseUrl: Api.baseUrl)
abstract class AppServiceClient{

  factory AppServiceClient (Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/customer/login")
  Future<LoginResponse> login(
      @Field("email") String email, @Field ("password") String password
      );

}