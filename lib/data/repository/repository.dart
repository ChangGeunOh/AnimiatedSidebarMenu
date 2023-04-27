import 'package:animiated_sidebar_menu/data/repository/database_source_impl.dart';
import 'package:animiated_sidebar_menu/data/repository/datastore_source_impl.dart';
import 'package:animiated_sidebar_menu/data/repository/network_source_impl.dart';
import 'package:animiated_sidebar_menu/domain/repository/database_source.dart';
import 'package:animiated_sidebar_menu/domain/repository/datastore_source.dart';
import 'package:animiated_sidebar_menu/domain/repository/network_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository.g.dart';

@riverpod
Repository repository(RepositoryRef ref) {
  final databaseSource = ref.watch(databaseSourceProvider);
  final dataStoreSource = ref.watch(dataStoreSourceProvider);
  final networkSource = ref.watch(networkSourceProvider);

  return Repository(
    databaseSource: databaseSource,
    dataStoreSource: dataStoreSource,
    networkSource: networkSource,
  );
}

class Repository {
  final DatabaseSource _databaseSource;
  final DataStoreSource _dataStoreSource;
  final NetworkSource _networkSource;

  Repository({
    required DatabaseSource databaseSource,
    required DataStoreSource dataStoreSource,
    required NetworkSource networkSource,
  })  : _databaseSource = databaseSource,
        _dataStoreSource = dataStoreSource,
        _networkSource = networkSource;
}
