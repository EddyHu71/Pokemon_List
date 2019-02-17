import 'package:flutter/material.dart';
import 'package:home_app/pokemon.dart';
import 'package:home_app/pokemon_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(
  title: "Poke App",
  home: HomePage(),
  debugShowCheckedModeBanner: false,
));

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }

}

class HomePageState extends State<HomePage> {

  var url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  PokeHub pokeHub;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    var link = await http.get(url);
    var decode = jsonDecode(link.body);
    pokeHub = PokeHub.fromJson(decode);
    print(pokeHub.toJson());
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Poke App"),
        backgroundColor: Colors.cyan,
      ),
      body: pokeHub == null ? Center(
        child: CircularProgressIndicator(),
        ) : GridView.count(
        crossAxisCount: 2,
        children: pokeHub.pokemon.map((poke) => Padding(
          padding: const EdgeInsets.all(2.0),
          child: InkWell (
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PokeDetail(
                pokemon : poke,

              )));
            },
            child: Card(
              elevation: 3.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(poke.img))
                    ),
                  ),
                  Text(
                    poke.name,
                    style: TextStyle(fontSize: 20.0,
                        fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
          ),
        ))
            .toList()
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
      ),
    );
  }
  
}