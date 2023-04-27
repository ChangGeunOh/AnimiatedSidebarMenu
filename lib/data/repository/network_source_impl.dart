import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:animiated_sidebar_menu/domain/repository/network_source.dart';

part 'network_source_impl.g.dart';

@riverpod
NetworkSource networkSource(NetworkSourceRef ref) {
  return NetworkSourceImpl();
}

class NetworkSourceImpl extends NetworkSource {

}