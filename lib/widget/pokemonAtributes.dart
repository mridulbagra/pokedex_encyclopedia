import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/model/pokemon.dart';

class PokemonAtributes extends StatelessWidget{
  final String atribute;
  final String value;
  final Image image;
  final Color colorAtributo;

  PokemonAtributes(this.atribute,this.value,this.image,this.colorAtributo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 30,
              width: 30,
              child:this.image,
            ),

            Text("${atribute}", style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold,)),
            Text("${value}", style: TextStyle(fontSize: 20, color: colorAtributo,fontWeight: FontWeight.bold,)),
          ],
        ),

      ],
    );
  }

}