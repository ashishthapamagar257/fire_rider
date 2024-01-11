


import 'package:fire_leader/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SamplePage extends ConsumerWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(apiProvider);
    return SafeArea(
      child: Scaffold(
        body: state.when(
            data: (data){
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextFormField(
                      onFieldSubmitted: (val){
                        ref.read(apiProvider.notifier).getSearchNews(query: val.trim());
                      },
                    ),
                    if(data !=null)Expanded(
                        child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index){
                              return ListTile(
                                title: Text(data[index].title),
                              );
                            }
                        )
                    )
                  ],
                ),
              );
            } ,
            error: (err, st) => Center(child: Text('$err')),
            loading: () => const Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
