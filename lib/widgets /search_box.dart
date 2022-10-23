
import 'package:eng_eng_dictionary/widgets%20/reusable.dart';
import 'package:eng_eng_dictionary/widgets%20/search_view.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../constants/constants.dart';

class SearchCard extends StatefulWidget {
  const SearchCard({super.key});

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  @override

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        height: _height * 0.55,
        width: _width * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: const DecorationImage(
              image: NetworkImage(
                KcardBackImage,
              ),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {

                },
                icon: const Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: _height * 0.05,
              ),
              const Center(
                child: Text(
                  'Definition and Meaning',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              SizedBox(
                height: _height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableChip(
                      label: 'English',
                      imageAdress: 'assets/images/Hotpot.png',
                    ),
                    Container(
                      height: 25,
                      width: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 9, 1, 41),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Image.asset(
                        'assets/images/englishexchang.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    ReusableChip(
                      label: 'English',
                      imageAdress: 'assets/images/usa.png',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: _height * 0.09,
              ),
              GestureDetector(
                onTap: () => {},
                child: SearchView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
