import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fire_leader/api_service/auth_service.dart';
import 'package:image_picker/image_picker.dart';



final authProvider = AsyncNotifierProvider(() => AuthProvider());


class AuthProvider extends AsyncNotifier{

  @override
  FutureOr build() {

  }

  Future<void> userLogin({
    required String email,
    required String password
})async{
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => AuthService.userLogin(email: email, password: password));
  }

  Future<void> userRegister({
    required String email,
    required String password,
    required String username,
    required XFile image

  })async{
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => AuthService.userRegister(email: email, password: password, username: username, image: image));
  }

}


