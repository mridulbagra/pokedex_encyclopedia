import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/view/search.dart';
import 'package:pokedex/widget/pokemonCard.dart';
import 'package:pokedex/controller/controller.dart';
class Showcase extends StatefulWidget {
  @override
  _ShowcaseState createState() => _ShowcaseState();
}

class _ShowcaseState extends State<Showcase> {
  List<Pokemon> listaPokemons = [];

  Future getPokemons() async{
    List<Pokemon> poke = await Controller.retornaApi();
    setState((){
      listaPokemons = poke;
    });
  }








  @override
  Widget build(BuildContext context) {
    getPokemons();
    return Scaffold(
      appBar: AppBar(
        title: Container(width:100,height:100,child: Image.asset('images/pokedex.png')),
        backgroundColor:Color.fromARGB(233, 233, 233, 141),
        shadowColor: Colors.orangeAccent,
        actions:[ IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder:
              (context) => Search(this.listaPokemons)));
        }, icon: Icon(Icons.search),),]
      ),
      backgroundColor: Color.fromARGB(233, 233, 233, 141),
      body: ListView.separated(
        padding: const EdgeInsets.all(30),
        itemCount: listaPokemons.length,
        itemBuilder: (BuildContext context, int index) {
          return PokemonCard(listaPokemons[index]);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}


