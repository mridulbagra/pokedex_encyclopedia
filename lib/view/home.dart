import 'package:flutter/material.dart';
import 'package:pokedex/view/showcase.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(233, 233, 233, 141),
        body: Column(
          children: <Widget>[
            Image.asset('images/wallpPoke.png', fit: BoxFit.fitWidth),

            Container(
              width: 300,
              height: 200,
              child: Image.asset('images/fontePoke.png'),
            ),

            Container(
              height: 50,
              width: 150,
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context) => Showcase()));
                },
                shape: new RoundedRectangleBorder(borderRadius:
                new BorderRadius.circular(30.0)),
                icon: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset('images/pokebola.png'),
                ),
                label: const Text('Entrar',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                backgroundColor: Color.fromARGB(233, 233, 47, 47),
              ),
            ),

          ],
        )
    );
  }
}