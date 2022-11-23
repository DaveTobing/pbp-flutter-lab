import 'package:http/http.dart' as http;
import 'package:counter_7/model/watch_list.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/data.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/page/watch_list_page.dart';
import 'dart:convert';

// Collaborator : Alek Yoanda
class WatchListDetails extends StatefulWidget {
  WatchListDetails({Key? key, required this.movie}) : super(key: key);

  MyWatchList movie;

  @override
  State<WatchListDetails> createState() =>
      _WatchListDetailsState(movie);
}

class _WatchListDetailsState extends State<WatchListDetails> {
  MyWatchList movie;
  _WatchListDetailsState(this.movie);

  Future<List<MyWatchList>> fetchMyWatchlist() async {
    var url =
        Uri.parse('https://tugas2-pbp-alek.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    List<MyWatchList> watchlist = [];
    for (var d in data) {
      if (d != null) {
        watchlist.add(MyWatchList.fromJson(d));
      }
    }

    return watchlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rincian Watchlist'),
        ),
        drawer: Drawer(
            child: Column(
              children: [
                // Menambahkan clickable menu
                ListTile(
                title: const Text('counter_7'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage(title: "Counter",)),
                  );
                },
              ),
              ListTile(
                title: const Text('Tambah Budget'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyFormPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Data Budget'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyDataPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('My Watch List'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const WatchListPage()),
                  );
                },
              ),
              ],
            ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                movie.fields.title.toString(),
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Released Date: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(movie.fields.releaseDate.toString())
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Rating: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(movie.fields.rating.toString())
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Status: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text((movie.fields.watched) ? 'Watched' : 'Not watched')
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Review: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(movie.fields.review)
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    // Route menu ke halaman form
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WatchListPage(
                        ),
                      ),
                    );
                  },
                  child: Text("Back"))
            ],
          ),
        ));
  }
}