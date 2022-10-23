import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:im_animations/im_animations.dart';

import '../presentation/screens/search_screen.dart';

class SearchView extends StatefulWidget {
  SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

final TextEditingController _controller = TextEditingController();

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return SearchEngine(width: _width, height: _height,

    );
  }
}

class SearchEngine extends StatelessWidget {
  const SearchEngine({
    super.key,

    required double width,
    required double height,
  }) : _width = width, _height = height;

  final double _width;
  final double _height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(SearchPageRoute());
          },
          child: Container(
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
              onTap: (){
                Navigator.of(context).push(SearchPageRoute());
              },
              // onTap: searchPop,
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Type a word to search',
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  left: 24.0,
                ),
              ),
              onChanged: (String data) {},
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
                onPressed: (){
                  Navigator.of(context).push(SearchPageRoute());
                }
            ),
          ),
        ),
      ],
    );
  }
}
//TODO fix navigation to SearchPageRoute issue
