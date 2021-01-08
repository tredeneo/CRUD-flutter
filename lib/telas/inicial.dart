import 'package:crud/api/endpoint/Posts.dart';
import '../api/modelos/Posts.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Posts>> posts;
  Future<Posts> quase;
  void initState() {
    super.initState();
    //posts = pegarPosts();
    posts = pegarPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: FutureBuilder(
        future: pegarPosts(),
        builder: (context, AsyncSnapshot<List<Posts>> snapshot) {
          return buildListView(snapshot.data);
        },
      ),
    );
  }

  Widget buildListView(List<Posts> posts) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        Posts post = posts[index];
        return ListTile(
          title: Text(post.title),
          onTap: () {
            //Navigator.pushReplacementNamed(context, '/detalhe');
            Navigator.pushNamed(context, '/detalhe', arguments: post);
          },
          dense: true,
          selected: true,
        );
      },
    );
  }
}
