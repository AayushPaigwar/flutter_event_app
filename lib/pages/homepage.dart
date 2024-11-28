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
        flexibleSpace: Image.asset(
          'assets/appbg.jpg',
          fit: BoxFit.cover,
          color: Colors.black.withOpacity(0.5),
          colorBlendMode: BlendMode.darken,
        ),
        forceMaterialTransparency: true,
        title: Row(
          children: [
            Image.asset('assets/logobg.png', height: 50),
            const Text('Nagpur', style: TextStyle(color: Colors.white)),
            const Icon(Icons.arrow_drop_down, color: Colors.white, size: 30),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Coming soon'),
                ),
              );
            },
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
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
        ),
        scrolledUnderElevation: 10,
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
