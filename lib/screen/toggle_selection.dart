import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleSelection extends StatefulWidget {
  const ToggleSelection({super.key});

  @override
  State<ToggleSelection> createState() => _ToggleSelectionState();
}

class _ToggleSelectionState extends State<ToggleSelection> {
  bool isFollow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 140),
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 140,
                  backgroundImage: AssetImage("assets/sonic.png"),
                ),

                Positioned(
                  bottom: -20,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFollow = !isFollow;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.pink,
                      radius: 25,
                      child: Icon(
                        isFollow
                            ? CupertinoIcons.check_mark
                            : CupertinoIcons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            Text(
              "Sonic",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),

            SizedBox(height: 10),

            Text(
              "Sonic the Hedgehog",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
