import 'package:dartz/dartz.dart';
import 'package:yalla_shopping/data/data_source/remote_data_source.dart';
import 'package:yalla_shopping/data/network/error_handler.dart';
import 'package:yalla_shopping/data/network/failure.dart';
import 'package:yalla_shopping/data/network/network_info.dart';
import 'package:yalla_shopping/data/requests/login_request.dart';
import 'package:yalla_shopping/domain/models/onboarding_model.dart';
import 'package:yalla_shopping/domain/respository/repository.dart';
import 'package:yalla_shopping/data/mapper/mapper.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      /// it's connected to internet, it's safe to call api.

      try{
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          /// success, return either right -return data-.
          return Right(response.toDomain());
        } else {
          /// error, return either left -return error msg-.
          return Left(Failure(code: ApiInternalStatus.FAILURE, message: ResponseMessage.UNKNOWN));
        }
      }catch(error){
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      /// return internet connection error
      /// return either left -return error msg-.
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
