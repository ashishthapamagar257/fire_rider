import 'package:fire_leader/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
        appBar: AppBar(),
        drawer:  Drawer(
          child: ListView(
            children: [
              ListTile(
                onTap: (){
                  ref.read(loginAuthProvider.notifier).userLogOut();
                },
                title: Text('User LogOut'),
                leading: Icon(Icons.exit_to_app),
              )
            ],
          ),
        ),
        body: const Placeholder()
    );
  }
}
