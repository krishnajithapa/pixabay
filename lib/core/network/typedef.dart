import 'package:dartz/dartz.dart';
import 'package:pixabay/core/error/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = ResultFuture<void>;
