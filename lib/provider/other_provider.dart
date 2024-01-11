import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = NotifierProvider<LoginProvider, bool>(()=> LoginProvider());
class LoginProvider extends Notifier<bool>{

  @override
  bool build(){
    return true;
  }

  void change(){
    state = !state;
  }
}