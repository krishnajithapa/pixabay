import 'package:dartz/dartz.dart';
import 'package:pixabay/core/app_core.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = ResultFuture<void>;
