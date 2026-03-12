import 'package:flutter/material.dart';

class SingleSelection extends StatefulWidget {
  const SingleSelection({super.key});

  @override
  State<SingleSelection> createState() => _SingleSelectionState();
}

class _SingleSelectionState extends State<SingleSelection> {
  List<Map> gifts = [
    {"name": "Lion", "image": "assets/animals/lion.png"},
    {"name": "Cow", "image": "assets/animals/cow.png"},
    {"name": "Deer", "image": "assets/animals/deer.png"},
    {"name": "Giraffe", "image": "assets/animals/giraffe.png"},
    {"name": "Pingeon", "image": "assets/animals/pingeon.png"},
    {"name": "Rat", "image": "assets/animals/rat.png"},
    {"name": "Tiger", "image": "assets/animals/tiger.png"},
    {"name": "WhiteTiger", "image": "assets/animals/white-tiger.png"},
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,

      body: Padding(
        padding: const EdgeInsets.all(30),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 40,
            crossAxisSpacing: 5,
            childAspectRatio: 0.8,
          ),
          itemCount: gifts.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Stack(
                children: [
                  selectedIndex == index
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black12,
                                  Colors.black26,
                                  Colors.black12,
                                ],
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  Column(
                    children: [
                      Image.asset(
                        width: 300,
                        height: selectedIndex == index ? 110 : 100,
                        gifts[index]["image"],
                      ),
                      // SizedBox(height: 20),
                      selectedIndex == index
                          ? SizedBox.shrink()
                          : Text(
                              '${gifts[index]["name"]}'.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                    ],
                  ),
                  selectedIndex == index
                      ? Positioned(
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                'Send',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
