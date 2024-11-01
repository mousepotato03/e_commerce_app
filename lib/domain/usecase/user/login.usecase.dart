import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../../core/util/exception/common_exception.dart';
import '../../../core/util/logger.dart';
import '../../repository/user.repository.dart';
import '../base/remote.usecase.dart';

class LoginUsecase extends RemoteUsecase<UserRepository> {
  @override
  Future<User?> call(UserRepository repository) async {
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
      } catch (e) {
        if (e is KakaoAuthException &&
            (e.message?.contains('Cancelled') ?? false)) {
          return null;
        }

        await _loginWithKakaoAccount();
      }
    } else {
      await _loginWithKakaoAccount();
    }
    return await UserApi.instance.me();
  }

  Future<void> _loginWithKakaoAccount() async {
    try {
      await UserApi.instance.loginWithKakaoAccount();
    } catch (e) {
      if (e is PlatformException && e.code == 'Cancelled') {
        return null;
      }

      CustomLogger.logger.e("${e.toString()}");
      throw CommonException.setError(e);
    }
  }
}
