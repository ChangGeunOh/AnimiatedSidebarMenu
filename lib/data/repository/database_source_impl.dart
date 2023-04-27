import 'package:animiated_sidebar_menu/domain/repository/database_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_source_impl.g.dart';


@riverpod
DatabaseSource databaseSource(DatabaseSourceRef ref) {
  return DatabaseSourceImpl();
}

class DatabaseSourceImpl extends DatabaseSource {

}