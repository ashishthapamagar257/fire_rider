


import 'package:fire_leader/api_service/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final apiProvider = AsyncNotifierProvider(() => ApiProvider());


class ApiProvider extends AsyncNotifier{

  @override
  FutureOr build() {

  }

  Future<void> getSearchNews({required String query})async{
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => ApiService.getSearchNews(query: query));
  }
}

