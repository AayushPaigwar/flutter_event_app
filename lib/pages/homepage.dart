import 'package:flutter/material.dart';
import 'package:flutter_assignment/widgets/bottomsheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'allcategory.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      appBar: AppBar(
        title: const SizedBox(
          height: 50,

          // search bar
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(60)),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(60)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              hintText: 'Search',
            ),
          ),
        ),
      ),

      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // filter options
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // categories
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isPressed = !isPressed;
                        });
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return const Bottomsheet();
                          },
                        ).then(
                          (value) => setState(
                            () {
                              isPressed = !isPressed;
                            },
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.category,
                            size: 20,
                            color: isPressed ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            'Categories',
                            style: TextStyle(
                                color: isPressed ? Colors.blue : Colors.grey),
                          ),
                        ],
                      ),
                    ),

                    // date and time
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Coming soon'),
                          ),
                        );
                      },
                      child: GestureDetector(
                        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Coming soon'),
                          ),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              size: 20,
                              color: Colors.grey,
                            ),
                            Text(
                              'Date & Time',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // sort
                    const Row(
                      children: [
                        Icon(
                          Icons.filter,
                          size: 20,
                          color: Colors.grey,
                        ),
                        Text(
                          'Sort',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),

              // all categories
              const AllCategory(),
            ],
          ),
        ),
      ),
    );
  }
}
