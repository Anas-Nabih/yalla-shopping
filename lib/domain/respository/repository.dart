import 'package:dartz/dartz.dart';
import 'package:yalla_shopping/data/failure.dart';
import 'package:yalla_shopping/data/requests/login_request.dart';
import 'package:yalla_shopping/domain/models/onboarding_model.dart';

abstract class Repository{
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}