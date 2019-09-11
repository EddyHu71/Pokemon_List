import 'package:flutter/material.dart';
import 'package:home_app/pokemon.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;
  
  PokeDetail({this.pokemon});
  
  bodyWidget(BuildContext context)=> Stack(
    children: <Widget>[
      Positioned(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width - 20.0,
        left: 10.0,
        top: MediaQuery.of(context).size.height * 0.1,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(height: 120.0,),
              Text(pokemon.name,
                style: TextStyle(fontSize: 20.0,
                  fontWeight: FontWeight.w800),),
              Text("Height : ${pokemon.height}"),
              Text("Weight : ${pokemon.weight}"),
              Text("Types", style : TextStyle(fontWeight: FontWeight.w800)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.type.map((t) => FilterChip(
                    backgroundColor: Colors.amber,
                    label: Text(t), onSelected: (b){})).toList(),
              ),
              Container(
                  child: Column(
                        children: <Widget>[
                    Text("Weakness", style: TextStyle(fontWeight: FontWeight.w800),),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses.map((t) => FilterChip(
                    backgroundColor: Colors.red,
                    label: Text(t, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    ), onSelected: (b){})).toList(),
                      ),
                      ],
                    ),
                  ),
              pokemon.nextEvolution == null ? Container(
                child: Text("Final Evolution", style: TextStyle(fontWeight: FontWeight.w800),),
              ) : Container(
                child: Column(
                  children: <Widget>[
                    Text("Next Evolution", style: TextStyle(fontWeight: FontWeight.w800),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.nextEvolution.map((n) => FilterChip(
                        backgroundColor: Colors.yellow[900],
                          label: Text(n.name, style: TextStyle(fontWeight : FontWeight.bold, color: Colors.white),
                          ), onSelected: (b){})).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Hero(tag: pokemon.img, child: Container(
          height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(pokemon.img)),
          ),
        ),),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.cyan,
        title: Text(pokemon.name),

      ),
      body: bodyWidget(context),
    );
  }
}