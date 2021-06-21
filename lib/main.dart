import 'package:flutter/material.dart';
import 'wp-api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('eosmrtnice'),
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchWpPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Map wppost = snapshot.data[index];
                  String ime = wppost['acf']['ime_i_prezime'] as String;
                  String godina = wppost['acf']['godina_smrti'] as String;
                  String boxL = wppost['acf']['text_box_za_l'] as String;
                  return Column(children: [
                    Text(ime),
                    Text(godina),
                    Text(boxL),
                    //test
                  ]);
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
