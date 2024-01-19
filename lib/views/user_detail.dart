import 'package:fire_leader/views/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:get/get.dart';
import 'package:fire_leader/constants/app_sizes.dart';
import 'package:fire_leader/provider/post_provider.dart';
import 'package:fire_leader/provider/room_provider.dart';


class UserDetail extends ConsumerWidget {
  final types.User user;
  const UserDetail({super.key, required this.user});

  @override
  Widget build(BuildContext context, ref) {

    ref.listen(roomNotifyProvider, (previous, next) {

      if(!next.hasError && !next.isLoading){
        if(next.value != null){
          Get.to(() => ChatPage(room: next.value  as types.Room, token: '', currentName: '',));
        }
      }
    });
    final state =ref.watch(getPostByUser(user.id));
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(user.imageUrl!),),
                    AppSizes.gapW20,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.firstName!),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: OutlinedButton(onPressed: (){
                            ref.read(roomNotifyProvider.notifier).roomCreate(user: user);
                          }, child: const Text('Start Chat')),
                        ),
                        Text(user.metadata!['email'])
                      ],
                    )
                  ],
                ),
                Expanded(child: state.when(
                    data: (data){
                      return GridView.builder(
                          itemCount: data.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2
                          ),
                          itemBuilder: (context, index){
                            return Image.network(data[index].imageUrl);
                          }
                      );
                    },
                    error: (err, st) => Center(child: Text('$err')),
                    loading: () => const Center(child: CircularProgressIndicator())
                ))
              ],
            ),
          ),
        )
    );
  }
}