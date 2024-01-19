import 'dart:async';

import 'package:fire_leader/provider/other_provider.dart';
import 'package:fire_leader/views/status_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
}
final channel = const AndroidNotificationChannel(
  'high_importance_channel', // id
  'high_importance_channel', // title
  description:
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  await Future.delayed(Duration(milliseconds: 500));
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
 runApp(ProviderScope(child: Home()));
}


class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final mode = ref.watch(toggleProvider);
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: mode ? ThemeData.dark(
          useMaterial3: true,
        ): ThemeData.light(useMaterial3: true),
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


