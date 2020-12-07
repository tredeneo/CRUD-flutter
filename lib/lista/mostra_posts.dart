import 'package:flutter/cupertino.dart';

ListView postsListView(data) {
  return ListView.builder(
    itemCount: data.lenght,
    itemBuilder: (context, index) {
      //return criaLinha(child: Text(data[index].title));
      return Text(data[index].title);
    },
  );
}

Widget criaLinha(dynamic item) => Container(
      child: Column(
        children: [Text(item.title)],
      ),
    );
