import 'package:yalla_shopping/data/network/app_service_client.dart';
import 'package:yalla_shopping/data/requests/login_request.dart';
import 'package:yalla_shopping/data/responses/base_response.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImplementation implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImplementation(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(loginRequest.email, loginRequest.password);
  }
}
