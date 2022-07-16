import 'package:dartz/dartz.dart';
import 'package:yalla_shopping/data/network/failure.dart';

abstract class BaseUseCases<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
