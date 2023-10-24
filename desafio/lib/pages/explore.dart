import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:desafio/settings/preference_page.dart';
import 'package:http/http.dart' as http; 
import 'package:desafio/pages/widgets/genreCard.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePage();
}

class _ExplorePage extends State<ExplorePage> {
  List _genre = [];

  Future<void> fetchJsonData() async {
    try {
      final response = await http.get(Uri.parse('https://my-json-server.typicode.com/jaznahmendez/movilesTestData/db'));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          _genre = data["genres"];
        });
        print(_genre);
      } else {
        print('Error loading JSON: HTTP ${response.statusCode}');
      }
    } catch (error) {
      print('Error loading JSON: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => PreferencesPage()),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: fetchJsonData,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
          child: ListView(
            children: <Widget>[
              const Text(
                "Genres",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (_genre.isNotEmpty)
                SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: _genre.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GenreCard(genre: _genre[index]);
                    },
                  ),
                )
              else
                const Center(
                  child: Text("No songs available."),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
