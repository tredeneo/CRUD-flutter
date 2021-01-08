import 'package:flutter/material.dart';
import '../api/modelos/Posts.dart';
import '../api/endpoint/Posts.dart';

class PostDetalhe extends StatefulWidget {
  @override
  _PostDetalheState createState() => _PostDetalheState();
}

class _PostDetalheState extends State<PostDetalhe> {
  bool trocaBotao = true;
  var textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Posts args = ModalRoute.of(context).settings.arguments;
    textController.text = args.body;
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Post"),
      ),
      body: Column(
        children: [
          Flexible(
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              initialValue: textController.text,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'What do people call you?',
                labelText: 'Post',
              ),
              onSaved: (String value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    trocaBotao = !trocaBotao;
                  });
                },
                child: Text("modificar"),
              ),
              Visibility(
                child: ElevatedButton(
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
                visible: trocaBotao,
              ),
              Visibility(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      trocaBotao = !trocaBotao;
                    });
                  },
                  child: Text('Cancelar'),
                ),
                visible: !trocaBotao,
              )
            ],
          ),
        ],
      ),
    );
  }
}
