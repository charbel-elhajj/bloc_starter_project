import 'package:bloc_starter_project/core/services/http_client_service.dart';
import 'package:bloc_starter_project/features/counter/data/data_sources/counter_remote_data_source.dart';
import 'package:bloc_starter_project/features/counter/data/repositories/counter_repository_impl.dart';
import 'package:bloc_starter_project/features/counter/domain/repositories/counter_repository.dart';
import 'package:bloc_starter_project/features/counter/domain/usecases/update_count.dart';
import 'package:bloc_starter_project/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  const apiUrl = 'https://www.example.com/';

  //! Features - Contact
  // Bloc
  GetIt.I.registerFactory(() => CounterBloc(updateCount: GetIt.I()));

  // Use cases
  GetIt.I.registerLazySingleton(() => UpdateCount(repository: GetIt.I()));

  // Repository (Generic Contract)
  GetIt.I.registerLazySingleton<CounterRepository>(() => CounterRepositoryImpl(remoteDataSource: GetIt.I()));

  // Data sources
  GetIt.I.registerLazySingleton<CounterRemoteDataSource>(() => CounterRemoteDataSourceImpl(client: GetIt.I()));
  //! Core

  // Services
  GetIt.I.registerLazySingleton(
    () => HttpClientService(
      url: apiUrl,
    ),
  );

  //! External Dependencies
}
