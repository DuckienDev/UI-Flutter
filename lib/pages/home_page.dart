import 'package:boats_ui/models/boart.dart';
import 'package:boats_ui/pages/detail_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BoartSlider extends StatefulWidget {
  const BoartSlider({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BoartSliderState createState() => _BoartSliderState();
}

List<Boart> listBoart() {
  return [
    Boart(
        name: 'YACHT M48',
        by: 'Garroni Design / Philippe Briand',
        img: 'assets/boat01.png'),
    Boart(name: 'ANTIRES 42', by: 'BENETEAU POWER', img: 'assets/boat02.png'),
    Boart(
        name: 'MERRY FISHER 38 FLY', by: 'Jeanneau', img: 'assets/boat04.png'),
  ];
}

class _BoartSliderState extends State<BoartSlider> {
  late PageController _pageController;
  int _currentPage = 0;
  List<Boart> boartList = listBoart();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // APP BAR
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Boart',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                ],
              ),
            ),
            // ITEM
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 600,
                    child: CarouselSlider.builder(
                      itemCount: boartList.length,
                      itemBuilder: (context, index, realIndex) {
                        final boart = boartList[index];

                        return Hero(
                          tag: boart.img,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(boart.img),
                              ),
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: 600.0,
                        enlargeCenterPage: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        viewportFraction: 0.8,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Shimmer.fromColors(
                      baseColor: Colors.black,
                      highlightColor: Colors.white,
                      child: Text(
                        boartList[_currentPage].name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('By '),
                      Text(
                        boartList[_currentPage].by,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration:
                              const Duration(milliseconds: 1500),
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  DetailPage(
                            img: boartList[_currentPage].img,
                            name: boartList[_currentPage].name,
                            by: boartList[_currentPage].by,
                          ),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'SPEC >',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
