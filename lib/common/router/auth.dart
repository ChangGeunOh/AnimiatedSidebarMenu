import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/network/model/token_data.dart';

part 'auth.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  TokenData? build() {
    return null;
  }

  void setToken(TokenData tokenData) {
    state = tokenData;
  }
}
