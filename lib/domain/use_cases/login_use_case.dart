import 'package:dartz/dartz.dart';
import 'package:yalla_shopping/data/network/failure.dart';
import 'package:yalla_shopping/data/requests/login_request.dart';
import 'package:yalla_shopping/domain/models/onboarding_model.dart';
import 'package:yalla_shopping/domain/respository/repository.dart';
import 'package:yalla_shopping/domain/use_cases/base_use_cases.dart';

class LoginUseCase implements BaseUseCases<LoginUseCaseInput, Authentication> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(input) async {
    return await _repository.login(LoginRequest(email: input.email, password: input.password));
  }
}

class LoginUseCaseInput {
  final String email;
  final String password;

  LoginUseCaseInput({required this.email, required this.password});
}
