import 'package:fire_leader/provider/auth_provider.dart';
import 'package:fire_leader/views/auth_page.dart';
import 'package:fire_leader/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class StatusPage extends ConsumerWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final auth = ref.watch(userStream);
    return auth.when(
        data: (data){
          if(data == null){
            return AuthPage();
          }else{
            return HomePage();
          }
        },
        error: (err, st) => Center(child: Text('$err')),
        loading: () => const Center(child: CircularProgressIndicator())
    );
  }
}