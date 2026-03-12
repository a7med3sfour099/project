import 'package:flutter/material.dart';

class MultiSelection extends StatefulWidget {
  const MultiSelection({super.key});

  @override
  State<MultiSelection> createState() => _MultiSelectionState();
}

class _MultiSelectionState extends State<MultiSelection> {
  List<String> types = [
    'News',
    'Entertainment',
    'Sports',
    'Business',
    'Science',
    'Technology',
    'Health',
    'Travel',
    'Food',
    'Fashion',
    'Gaming',
    'Books',
  ];

  Set<String> emptyType = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 140),

              Text(
                'What do you want to see on X?',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              SizedBox(height: 30),

              Wrap(
                spacing: 20,
                runSpacing: 10,
                children: List.generate(types.length, (index) {
                  final type = types[index];
                  final isSelected = emptyType.contains(type);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          emptyType.remove(type);
                        } else {
                          emptyType.add(type);
                        }
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 350),
                      curve: Curves.easeIn,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue : Colors.grey.shade900,
                        // border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                      child: Text(type, style: TextStyle(color: Colors.white)),
                    ),
                  );
                }),
              ),
              SizedBox(height: 80),
              Center(
                child: Column(
                  spacing: 10,
                  children: emptyType
                      .map(
                        (e) => Text(
                          e,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
