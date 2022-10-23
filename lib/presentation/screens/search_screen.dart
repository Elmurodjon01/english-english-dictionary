import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:im_animations/im_animations.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Timer? debounce;
  late Stream stream;
  StreamController streamController = StreamController();
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    stream = streamController.stream;
  }

  String url = "https://owlbot.info/api/v4/dictionary/";
  String token = '94043dfb834b3e3869d3a6919a91a46df04dd68a';
  searching() async {
    if (_controller.text == null || _controller.text.length == 0) {
      streamController.add(null);
      return;
    }
    streamController.add('waiting');
    Response response =
    await get(Uri.parse(url + _controller.text.trim()), headers: {
      "Authentication": "Token $token",
    });
    streamController.add(
      json.decode(response.body),
    );
  }

  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: _width * 0.6,
                        height: _height * 0.05,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                        child: TextFormField(
                          onTap: () {},
                          // onTap: searchPop,
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintText: 'Type a word to search',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                              left: 24.0,
                            ),
                          ),
                          onChanged: (String data) {
                            if (debounce?.isActive ?? false) debounce?.cancel();
                            debounce =
                                Timer(const Duration(milliseconds: 1000), () {
                                  searching();
                                });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 5),
                        height: _height * 0.05,
                        width: _width * 0.1,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                        ),
                        child: ColorSonar(
                          contentAreaRadius: 1,
                          waveFall: 6.0,
                          waveMotion: WaveMotion.synced,
                          child: IconButton(
                            icon: const Icon(
                              Icons.search_sharp,
                              color: Color.fromARGB(255, 9, 1, 41),
                            ),
                            onPressed: () {
                              searching();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10, top: 10),
                  child: StreamBuilder(
                      stream: stream,
                      builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return Center(
                            child: Text("Enter a search word"),
                          );
                        }

                        if (snapshot.data == "waiting") {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return ListView.builder(
                          itemCount: snapshot.data["definitions"].length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListBody(
                              children: <Widget>[
                                Container(
                                  color: Colors.grey[300],
                                  child: ListTile(
                                    leading: snapshot.data["definitions"][index]
                                    ["image_url"] ==
                                        null
                                        ? null
                                        : CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          snapshot.data["definitions"]
                                          [index]["image_url"]),
                                    ),
                                    title: Text(
                                        "${"${_controller.text.trim()}(" + snapshot.data["definitions"][index]["type"]})"),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(snapshot.data["definitions"][index]
                                  ["definition"]),
                                )
                              ],
                            );
                          },
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchPageRoute extends PageRouteBuilder {
  SearchPageRoute()
      : super(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
          SearchScreen());
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(0, 1), end: Offset(.0, .0))
          .animate(controller!),
      child: SearchScreen(),
    );
  }
}