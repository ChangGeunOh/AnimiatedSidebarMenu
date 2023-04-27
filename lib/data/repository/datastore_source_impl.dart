import 'package:animiated_sidebar_menu/domain/repository/datastore_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'datastore_source_impl.g.dart';

@riverpod
DataStoreSource dataStoreSource(DataStoreSourceRef ref) {
  return DataStoreSourceImpl();
}

class DataStoreSourceImpl extends DataStoreSource {

}