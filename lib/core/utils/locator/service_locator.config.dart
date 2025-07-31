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
import 'package:objectbox/objectbox.dart' as _i1034;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../../features/favorite/data/datasources/favorite_local_data_source.dart'
    as _i790;
import '../../../features/favorite/data/datasources/remote/add_favorite_remote_data_source.dart'
    as _i41;
import '../../../features/favorite/data/repositories/add_favorite_respository_impl.dart'
    as _i41;
import '../../../features/favorite/domain/repositories/add_favorite_repository.dart'
    as _i332;
import '../../../features/favorite/domain/usecases/add_favorite_usercase.dart'
    as _i772;
import '../../../features/favorite/domain/usecases/get_image_usecase.dart'
    as _i499;
import '../../../features/favorite/domain/usecases/remove_favorite_usecase.dart'
    as _i146;
import '../../../features/favorite/presentation/bloc/add_favorite_bloc.dart'
    as _i1036;
import '../../../features/home/data/datasources/local/home_local_data_source.dart'
    as _i623;
import '../../../features/home/data/repositories/home_repository_impl.dart'
    as _i955;
import '../../../features/home/domain/repositories/home_repository.dart'
    as _i834;
import '../../../features/home/domain/usecases/get_saved_image_usecase.dart'
    as _i296;
import '../../../features/home/presentation/bloc/home_bloc.dart' as _i84;
import '../../../objectbox.g.dart' as _i941;
import '../../network/alice_interceptor.dart' as _i689;
import '../../network/dio_client.dart' as _i703;
import '../../network/dio_module.dart' as _i459;
import '../../resources/objectbox_module.dart' as _i351;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    final dioModule = _$DioModule();
    await gh.factoryAsync<_i941.Store>(
      () => registerModule.store,
      preResolve: true,
    );
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioModule.logger);
    gh.lazySingleton<_i689.AliceInterceptor>(() => dioModule.aliceInterceptor);
    gh.lazySingleton<_i623.HomeLocalDataSource>(
      () => _i623.HomeLocalDataSource(gh<_i1034.Store>()),
    );
    gh.factory<_i790.FavoriteLocalDataSource>(
      () => _i790.FavoriteLocalDataSource(gh<_i941.Store>()),
    );
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
    gh.lazySingleton<_i834.HomeRepository>(
      () => _i955.HomeRepositoryImpl(gh<_i623.HomeLocalDataSource>()),
    );
    gh.factory<_i332.AddFavoriteRepository>(
      () => _i41.AddFavoriteRepositoryImpl(
        gh<_i41.AddFavoriteRemoteDataSource>(),
        gh<_i790.FavoriteLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i296.GetSavedImagesUseCase>(
      () => _i296.GetSavedImagesUseCase(gh<_i834.HomeRepository>()),
    );
    gh.factory<_i499.GetImageUseCase>(
      () => _i499.GetImageUseCase(gh<_i332.AddFavoriteRepository>()),
    );
    gh.factory<_i772.AddFavoriteUsecase>(
      () => _i772.AddFavoriteUsecase(gh<_i332.AddFavoriteRepository>()),
    );
    gh.factory<_i146.RemoveFavoriteUsecase>(
      () => _i146.RemoveFavoriteUsecase(gh<_i332.AddFavoriteRepository>()),
    );
    gh.lazySingleton<_i84.HomeBloc>(
      () => _i84.HomeBloc(
        gh<_i296.GetSavedImagesUseCase>(),
        gh<_i146.RemoveFavoriteUsecase>(),
      ),
    );
    gh.factory<_i1036.AddFavoriteBloc>(
      () => _i1036.AddFavoriteBloc(
        gh<_i499.GetImageUseCase>(),
        gh<_i772.AddFavoriteUsecase>(),
        gh<_i146.RemoveFavoriteUsecase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i351.RegisterModule {}

class _$DioModule extends _i459.DioModule {}
