import 'package:boats_ui/widgets/animation_img.dart';
import 'package:boats_ui/widgets/detail_img.dart';
import 'package:boats_ui/widgets/my_text_info.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String img;
  final String name;
  final String by;

  const DetailPage({
    super.key,
    required this.img,
    required this.name,
    required this.by,
  });

  @override
  // ignore: library_private_types_in_public_api
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward(); // Bắt đầu animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRect(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 0.8,
                  child: Stack(
                    children: [
                      //IMAGE BOART
                      Row(
                        children: [
                          const SizedBox(
                            width: 200,
                          ),
                          Hero(
                            tag: widget.img,
                            child: CustomTransition(
                              animation: _controller,
                              child: SizedBox(
                                height: 400,
                                child: Image.asset(
                                  widget.img,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 90.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //BACK TO HOMESCREEN
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back_ios)),
                            const SizedBox(height: 80),

                            Padding(
                              padding: const EdgeInsets.all(10),
                              //NAME BOART
                              child: Text(
                                widget.name,
                                style: const TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.w600),
                              ),
                            ),
                            //BY
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Row(
                                children: [
                                  const Text('By : '),
                                  Text(
                                    widget.by,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            //INFOMATION
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                '${widget.name} is perfectly designed for family yachts and'
                                'provides plenty of space, with a beautifully designed living'
                                'room with opposite chairs that can be converted into a double'
                                'dock, a giant flight bridge, two double cabins, two bathrooms'
                                'and all this on one of the best .',
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w300),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //SPECS
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'SPECS',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  MyTextInfo(
                    text1: 'Boat Length',
                    text2: '24\'2',
                  ),
                  MyTextInfo(
                    text1: 'Beam',
                    text2: '122\'',
                  ),
                  MyTextInfo(
                    text1: 'Weight',
                    text2: '2765 KG',
                  ),
                  MyTextInfo(
                    text1: 'Fuel Capacity',
                    text2: '322 L',
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'GALLERY',
                  style: TextStyle(fontSize: 20),
                ),
              ),
          //IMAGE BOAT
              SizedBox(
                height: 145,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    DetailImg(
                      img: 'assets/detail4.png',
                    ),
                    DetailImg(
                      img: 'assets/detail3.png',
                    ),
                    DetailImg(
                      img: 'assets/detail2.png',
                    ),
                    DetailImg(
                      img: 'assets/detail1.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
