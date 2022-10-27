import 'package:audioplayers/audioplayers.dart';
import 'package:eng_eng_dictionary/model/dict_model.dart';
import 'package:eng_eng_dictionary/services/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:im_animations/im_animations.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();

  AudioPlayer? audioPlayer;

  @override
  void initState() {
    super.initState();
    setState(() {
      audioPlayer = AudioPlayer();
    });
  }

  void playAudio(var music) {
    audioPlayer!.stop();

    audioPlayer!.play(music);
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 40),
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
                              // onTap: searchPop,
                              controller: controller,
                              decoration: const InputDecoration(
                                hintText: 'Type a word to search',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                  left: 24.0,
                                ),
                              ),
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
                                  if (controller.text.isNotEmpty) {
                                    setState(() {});
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Container(
                      //   padding: const EdgeInsets.symmetric(horizontal: 10),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     border: Border.all(),
                      //   ),
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         child: TextFormField(
                      //           controller: controller,
                      //           decoration: const InputDecoration(
                      //             label: Text('Search Query'),
                      //             border: InputBorder.none,
                      //           ),
                      //         ),
                      //       ),
                      //       IconButton(
                      //         onPressed: () {
                      //           if (controller.text.isNotEmpty) {
                      //             setState(() {});
                      //           }
                      //         },
                      //         icon: const Icon(Icons.search),
                      //       )
                      //     ],
                      //   ),
                      // ),

                      const SizedBox(
                        height: 20,
                      ),

                      ///FutureBuilder
                      controller.text.isEmpty
                          ? const SizedBox(child: Text('Search for something'))
                          : FutureBuilder(
                              future:
                                  DictService().searchWord(word: controller.text),
                              builder: (context,
                                  AsyncSnapshot<List<DictModel>> snapshot) {
                                print("Data $snapshot");
                                if (snapshot.hasData) {
                                  return Expanded(
                                    child: ListView(
                                      children: List.generate(
                                          snapshot.data!.length, (index) {
                                        final data = snapshot.data![index];
                                        return Container(
                                          child: Column(
                                            children: [
                                              Container(
                                                child: ListTile(
                                                  title: Text(data.word!),
                                                  subtitle: Text(data
                                                      .phonetics![index].text!),
                                                  trailing: IconButton(
                                                      onPressed: () {
                                                        final path = data
                                                            .phonetics![index]
                                                            .audio;
                                                        playAudio(UrlSource(
                                                            'https:$path'));
                                                        // playAudio("");
                                                      },
                                                      icon: const Icon(
                                                          Icons.audiotrack)),
                                                ),
                                              ),
                                              Container(
                                                child: ListTile(
                                                  title: Text(data
                                                      .meanings![index]
                                                      .definitions![index]
                                                      .definition!),
                                                  subtitle: Text(data
                                                      .meanings![index]
                                                      .partOfSpeech!),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text(snapshot.error.toString());
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              },
                            )
                    ],
                  ),
                ),
              )
            ],
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
