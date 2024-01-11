import 'dart:async';

import 'package:fire_leader/views/sample_page.dart';
import 'package:fire_leader/views/status_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fire_leader/views/auth_page.dart';
import 'firebase_options.dart';


void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  await Future.delayed(Duration(milliseconds: 500));
 runApp(ProviderScope(child: Home()));
}


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(
          useMaterial3: true,
        ),
          home: StatusPage(),
    );
  }
}
class Counter extends StatelessWidget {
  final numControl = StreamController<int>();
  int n = 2;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stream'),),
        body: StreamBuilder(
          stream: numControl.stream,
          builder: (context, snapshot) {
            return Center(child: Text('${snapshot.data}',style: TextStyle(fontSize: 50),));
          }
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          numControl.sink.add(n++);

        },child: Icon(Icons.add),
      ),
    );
  }
}


