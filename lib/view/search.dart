import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/widget/pokemonCard.dart';
import 'package:pokedex/controller/controller.dart';
class Search extends StatefulWidget {
  List<Pokemon> listaPokemons;
  Search(this.listaPokemons, {Key? key}) : super(key: key);
  @override
  _SearchState createState() => _SearchState(listaPokemons);
}

class _SearchState extends State<Search> {
  List<Pokemon> listaPokemons;
  List<Pokemon> listaFiltro = [];

  _SearchState(this.listaPokemons);

  void searchPokemon(String busca){
    setState(() {
      listaFiltro = listaPokemons.where((pokemon) => pokemon.nome.contains(busca)).toList();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Container(width:100,height:100,child: Image.asset('images/pokedex.png')),
          backgroundColor:Color.fromARGB(233, 233, 233, 141),
          shadowColor: Colors.orangeAccent,
      ),
      backgroundColor: Color.fromARGB(233, 233, 233, 141),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Pesquise pelo nome',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (String busca) {
              searchPokemon(busca);
            },
          ),
          ),
          Expanded(child: ListView.separated(
            padding: const EdgeInsets.all(30),
            itemCount: listaFiltro.length,
            itemBuilder: (BuildContext context, int index) {
              return PokemonCard(listaFiltro[index]);
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          ),
          ),
        ],
      )
    );
  }
}


