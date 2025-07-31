// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../../features/favorite/data/datasources/remote/add_favorite_remote_data_source.dart'
    as _i41;
import '../../../features/favorite/data/repositories/add_favorite_respository_impl.dart'
    as _i41;
import '../../../features/favorite/domain/repositories/add_favorite_repository.dart'
    as _i332;
import '../../../features/favorite/domain/usecases/get_image_usecase.dart'
    as _i499;
import '../../../features/favorite/presentation/bloc/add_favorite_bloc.dart'
    as _i1036;
import '../../network/alice_interceptor.dart' as _i689;
import '../../network/dio_client.dart' as _i703;
import '../../network/dio_module.dart' as _i459;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioModule.logger);
    gh.lazySingleton<_i689.AliceInterceptor>(() => dioModule.aliceInterceptor);
    gh.factory<String>(() => dioModule.baseUrl, instanceName: 'BaseUrl');
    gh.lazySingleton<List<_i361.Interceptor>>(
      () => dioModule.interceptors(
        gh<_i528.PrettyDioLogger>(),
        gh<_i689.AliceInterceptor>(),
      ),
    );
    gh.lazySingleton<_i703.DioClient>(
      () => dioModule.dioClient(
        gh<String>(instanceName: 'BaseUrl'),
        gh<List<_i361.Interceptor>>(),
      ),
    );
    gh.factory<_i41.AddFavoriteRemoteDataSource>(
      () => _i41.AddFavoriteRemoteDataSource(gh<_i703.DioClient>()),
    );
    gh.factory<_i332.AddFavoriteRepository>(
      () => _i41.AddFavoriteRepositoryImpl(
        gh<_i41.AddFavoriteRemoteDataSource>(),
      ),
    );
    gh.factory<_i499.GetImageUseCase>(
      () => _i499.GetImageUseCase(gh<_i332.AddFavoriteRepository>()),
    );
    gh.factory<_i1036.AddFavoriteBloc>(
      () => _i1036.AddFavoriteBloc(gh<_i499.GetImageUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i459.DioModule {}
