import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:pokedex/api/api.dart' as api;
import 'package:pokedex/model/pokemon.dart';

class Controller {

  static Future<List<Pokemon>> retornaApi() async {
    Dio dio = Dio();
    var response = await dio.get("https://pokeapi.co/api/v2/pokemon?limit=100&offset=0");
    List<Pokemon> pokemons = [];

    for(var i =0; i < response.data['results'].length; i++){
      var response2 = await dio.get(response.data['results'][i]['url']);
      pokemons.add(jsonToPokemon(response2.data));
    }
    return pokemons;
  }


  static Pokemon jsonToPokemon(json) {
    Pokemon pokemon = new Pokemon(
        json['id']  ?? 0,
        json['name'] ?? " ",
        json['stats'][1]['base_stat'] ?? 0,
        json['stats'][5]['base_stat'] ?? 0,
        json['stats'][0]['base_stat'] ?? 0,
        json['stats'][2]['base_stat'] ?? 0,
        json['types'][0]['type']['name'] ?? " ",
        json['sprites']['front_default'] ?? " ");

    return pokemon;
  }

}
