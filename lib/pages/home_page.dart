
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobx/mobx.dart';
import 'package:rest_api/stores/home_store.dart';

import '../models/post_model.dart';

class HomePage extends StatefulWidget {
   static const id = 'home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var store = HomeStore();

  @override
  void initState() {
    super.initState();
    store.getApiPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
          centerTitle: true,
        ),
      body: Observer(
        builder: (_) => ListView.builder(
          itemCount: store.items.length,
          itemBuilder: (context, index){
            return itemPostList(store.items[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add, color: Colors.white, size: 30,),
      ),
    );
  }
  Widget itemPostList(Post post){
    return  Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              flex: 1,
              onPressed: store.edit,
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),

      endActionPane:  ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 1,
            onPressed: store.delete,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Card(
        child: ListTile(
          title: Text(post.title!.toUpperCase(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 20,),),
          subtitle: Text(post. body!, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
        ),
      ),
    );
  }
}
