import 'dart:convert';

import 'package:crud_http/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Uri _urlBase = Uri.parse("https://jsonplaceholder.typicode.com");

  Future<List<Post>> _recuperarPostagens() async {
    http.Response response = await http.get(Uri.parse("$_urlBase/posts"));

    var dadosJson = await json.decode(response.body);

    List<Post> posts = [];

    for (var post in dadosJson) {
      Post p = Post(post['userId'], post['id'], post['title'], post['body']);
      posts.add(p);
    }

    return posts;
  }

  void _post() async {
    var body = json.encode(
      {
        "userId": 120,
        "id": null, //vai ser gerado de forma automatica
        "title": "Titulo da postagem",
        "body": "Corpo da postagem",
      },
    );

    http.Response response = await http.post(
      Uri.parse("$_urlBase/posts"),
      headers: {
        "Content-Type": "applications/json; charset=UTF-8",
      },
      body: body,
    );

    print("STATUS: ${response.statusCode}");
    print("BODY: ${response.body.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<List<Post>>(
          future: _recuperarPostagens(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;

              case ConnectionState.active:
                break;

              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());

              case ConnectionState.done:
                if (snapshot.hasError) {
                  return const Center(child: Text("Erro ao carregar dados"));
                } else {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: _post,
                            child: const Text("Salvar"),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("ok"),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("ok"),
                          )
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, indice) {
                            List<Post> posts = snapshot.data!;
                            Post post = posts[indice];

                            return ListTile(
                              title: Text(post.title),
                              subtitle: Text(post.body),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
            }
            return const Text("");
          },
        ),
      ),
    );
  }
}
