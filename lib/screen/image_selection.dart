import 'package:flutter/material.dart';

class ImageSelect extends StatefulWidget {
  const ImageSelect({super.key});

  @override
  State<ImageSelect> createState() => _ImageSelectState();
}

class _ImageSelectState extends State<ImageSelect> {
  List<String> photos = [
    "assets/laptop/labtop1.png",
    "assets/laptop/labtop3.png",
    "assets/laptop/labtop2.png",
    "assets/laptop/labtop4.png",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffdee08),
      body: Column(
        children: [
          SizedBox(height: 100),
          //Main Container
          SizedBox(
            child: Image.asset(
              height: 300,
              width: double.infinity,
              photos[selectedIndex],
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 50),

          //other photos
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                photos.length,
                (index) => InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedIndex == index
                            ? Colors.blue
                            : Colors.white,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    width: 100,
                    height: 100,
                    child: Image.asset(photos[index]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
