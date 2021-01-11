import 'package:flutter/material.dart';
import '../api/modelos/Posts.dart';
import '../api/endpoint/Posts.dart';

class PostDetalhe extends StatefulWidget {
  @override
  _PostDetalheState createState() => _PostDetalheState();
}

class _PostDetalheState extends State<PostDetalhe> {
  var textController = new TextEditingController();
  var key = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Posts args = ModalRoute.of(context).settings.arguments;
    textController.text = args.body;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Post"),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: key,
        child: Column(
          children: [
            TextFormField(
              initialValue: textController.text,
              maxLines: null,
              onSaved: (val) {
                atualizarPost(val, args.id.toString());
                print(val);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    key.currentState.save();
                  },
                  child: Text("salvar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigate back to first screen when tapped.
                    deletarPost(args.id.toString());
                    Navigator.pop(context);
                    //Navigator.pushNamed(context, '/');
                    /*
                    Navigator.pushReplacementNamed(context, '/resposta',
                        arguments: response);
                  */
                  },
                  child: Text('Deletar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Voltar'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
