import 'package:counter_7/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/page/data.dart';
import 'package:counter_7/model/watch_list.dart';
import 'package:counter_7/page/watch_list_details.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({ super.key });

  @override
  State<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  Future<List<MyWatchList>> fetchMyWatchlist() async {
        var url = Uri.parse('https://tugas2-pbp-alek.herokuapp.com/mywatchlist/json/');
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
        List<MyWatchList> listToDo = [];
        for (var d in data) {
        if (d != null) {
            listToDo.add(MyWatchList.fromJson(d));
        }
        }
        return listToDo;
    }
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
    appBar: AppBar(
        title: const Text('My Watch List'),
    ),
    drawer: Drawer(
        child: Column(
        children: [
            // Menambahkan clickable menu
            ListTile(
            title: const Text('Counter'),
            onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage(title: "Counter")),
                );
            },
            ),
            ListTile(
            title: const Text('Form Budget'),
            onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyFormPage()),
                );
            },
            ),
            ListTile(
            title: const Text('Data Budget'),
            onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyDataPage()),
                );
            },
            ),
            ListTile(
            title: const Text('My Watch List'),
            onTap: () {
                // Route menu ke halaman to do
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const WatchListPage()),
                );
            },
            ),
        ],
        ),
    ),
    body: FutureBuilder(
        future: fetchMyWatchlist(),
        builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
            } 
            else {
            if (!snapshot.hasData) {
                return Column(
                children: const [
                    Text(
                    "Tidak ada watchlist :(",
                    style: TextStyle(
                        color: Color(0xff59A5D8),
                        fontSize: 20),
                    ),
                    SizedBox(height: 8),
                ],
                );
            } 
            else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index)=> Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.0
                        )
                        ]
                    ),
                    child: ListTile(
                        title: Text(
                            "${snapshot.data![index].fields.title}",
                            style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                        onTap: () {
                          // Route menu ke halaman form
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WatchListDetails(
                                movie: snapshot.data![index],
                              ),
                            ),
                          );
                        },
                    ),
                    )
                );
            }
            }
        }
    )
);
  }
}
      