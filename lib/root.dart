import 'package:flutter/material.dart';
import 'package:flutterlogic/screen/image_selection.dart';
import 'package:flutterlogic/screen/multi_selection.dart';
import 'package:flutterlogic/screen/single_selection.dart';
import 'package:flutterlogic/screen/toggle_selection.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final PageController controller = PageController();
  List<Widget> screens = [
    SingleSelection(),
    ImageSelect(),
    ToggleSelection(),
    MultiSelection(),
    
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: screens,
        onPageChanged: (v) {
          setState(() {
            selectedIndex = v;
          });
        },
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                // previous
                GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.jumpToPage(selectedIndex - 1);
                    });
                  },

                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back, color: Colors.black),
                        SizedBox(width: 14),
                        Text(
                          'Previous page',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                // next
                GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.jumpToPage(selectedIndex + 1);
                    });
                  },

                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 40,
                    decoration: BoxDecoration(color: Colors.black),
                    child: Row(
                      children: [
                        Text(
                          'Next page',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 14),
                        Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
