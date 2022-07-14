import 'package:dartz/dartz.dart';
import 'package:yalla_shopping/data/data_source/remote_data_source.dart';
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

      final response = await _remoteDataSource.login(loginRequest);
      if (response.status == 0) {
        /// success, return either right -return data-.
        return Right(response.toDomain());
      } else {
        /// error, return either left -return error msg-.
        return Left(Failure(code: response.status ?? 409, message: response.message?? "Some thing wrong happened"));
      }
    } else {
      /// return internet connection error
      /// return either left -return error msg-.
      return Left(Failure(code: 501, message: "please check your internet connection, and try again."));
    }
  }
}
