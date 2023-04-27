import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'local_network.g.dart';

@Riverpod(keepAlive: true)
Dio localNetwork(LocalNetworkRef ref) {
  final dio = Dio();
  dio.interceptors.add(CustomInterceptor());
  return Dio();
}


class CustomInterceptor extends Interceptor {

}
