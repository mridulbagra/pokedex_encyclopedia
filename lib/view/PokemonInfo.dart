import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/widget/pokemonAtributes.dart';



class Pokemonstatus extends StatelessWidget {
  final Pokemon pokemon;

  Pokemonstatus(this.pokemon, {Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color.fromARGB(233, 233, 233, 141),
        appBar: AppBar(
          backgroundColor:Color.fromARGB(246, 246, 249,215 ),
        ),
        body: Column(
          children: [
            Container(
            height: 300,
            width: 800,
            decoration: BoxDecoration(
              color: Color.fromARGB(246, 246, 249,215 ),
            ),
             child: Column(
               children: [
                 Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      child: Image.asset('images/pokebolaBranca.png'),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "${pokemon.nome.toUpperCase()}",
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow( // bottomLeft
                              offset: Offset(1.0, 1.0),
                              color: Colors.black38,
                          ),
                        ],
                      ),
                    ),
                  ],
                 ),
                 Column(
                   children: [
                     Center(
                       child: Container(height: 200,width: 200,child: Image.network(pokemon.imageUrl,fit:BoxFit.fitHeight), ),
                     )
                   ],
                 ),
               ],
             ),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 177, 177, 177),
                      border: Border.all(color: Colors.white,width: 4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PokemonAtributes('ATK: ',pokemon.attack.toString(),Image.asset('images/ataque.png'),Colors.white),
                        PokemonAtributes('SPD: ',pokemon.speed.toString(),Image.asset('images/velocidade.png'),Colors.white),
                        PokemonAtributes('HP: ',pokemon.life.toString(),Image.asset('images/vida.png'),Colors.white),
                        PokemonAtributes('DEF: ',pokemon.defense.toString(),Image.asset('images/defesa.png'),Colors.white),
                        PokemonAtributes('ELE: ',pokemon.element.toUpperCase(),Image.asset('images/elemento.png'),Colors.white),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],

        ),
      );
    }




}
