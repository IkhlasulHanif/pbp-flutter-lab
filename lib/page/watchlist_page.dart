import 'package:counter_7/page/data.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/page/detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/watchlist.dart';
import 'package:counter_7/page/refractor.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({super.key});

  @override
  State<MyWatchListPage> createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {
  bool _isInit = true;

  changeIsInit() {
    _isInit = false;
    return fetchWatchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      // Menambahkan drawer menu
      drawer: const DrawerWidget(),
      body: FutureBuilder(
          future: fetchWatchList(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada Watch List :(",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyDetailPage(
                                          title: snapshot
                                              .data![index].fields.title,
                                          releaseDate: snapshot
                                              .data![index].fields.releaseDate,
                                          rating: snapshot
                                              .data![index].fields.rating,
                                          watched: snapshot
                                              .data![index].fields.watched,
                                          review: snapshot
                                              .data![index].fields.review,
                                        )));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color:
                                        (snapshot.data![index].fields.watched ==
                                                true)
                                            ? Colors.greenAccent
                                            : Colors.red,
                                    width: 3.0),
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data![index].fields.title}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Checkbox(
                                  value: snapshot.data![index].fields.watched,
                                  onChanged: (newValue) {
                                    setState(() {
                                      if (newValue! == true) {
                                        snapshot.data![index].fields.watched =
                                            true;
                                      } else {
                                        snapshot.data![index].fields.watched =
                                            false;
                                      }
                                      snapshot.data![index].fields.watched =
                                          newValue;
                                    });
                                  },
                                ),
                                // const SizedBox(height: 10),
                                // Text("${snapshot.data![index].fields.watched}"),
                              ],
                            ),
                          ),
                        ));
              }
            }
          }),
    );
  }
}
