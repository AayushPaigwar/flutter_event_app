import 'package:flutter/material.dart';

class Bottomsheet extends StatefulWidget {
  const Bottomsheet({
    super.key,
  });

  @override
  State<Bottomsheet> createState() => _BottomsheetState();
}

class _BottomsheetState extends State<Bottomsheet> {
  Map<String, bool> categories = {
    'Music': false,
    'Concert': false,
    'Parties': false,
    'Performance': false,
    'Comedy': false,
    'Dance': false,
    'Fine Arts': false,
    'Theatre': false,
    'Literary Arts': false,
    'Crafts': false,
    'Photography': false,
    'Cooking': false,
    'Fine Arts1': false,
    'Theatre1': false,
    'Literary Arts1': false,
    'Crafts1': false,
    'Photography1': false,
    'Cooking1': false,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            const Text(
              'Entertainment',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildFilterChip('Music'),
                buildFilterChip('Concert'),
                buildFilterChip('Parties'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildFilterChip("Performance"),
                buildFilterChip("Comedy"),
                buildFilterChip("Dance"),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            const Text(
              'Art & Theatre',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildFilterChip('Fine Arts'),
                buildFilterChip('Theatre'),
                buildFilterChip('Literary Arts'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildFilterChip('Crafts'),
                buildFilterChip('Photography'),
                buildFilterChip('Cooking'),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            const Text(
              'More',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildFilterChip('Fine Arts1'),
                buildFilterChip('Theatre1'),
                buildFilterChip('Literary Arts1'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildFilterChip('Crafts1'),
                buildFilterChip('Photography1'),
                buildFilterChip('Cooking1'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  FilterChip buildFilterChip(String category) {
    return FilterChip(
      showCheckmark: false,
      avatar: categories[category]!
          ? const Icon(Icons.close, color: Colors.white)
          : null,
      label: Text(category),
      labelStyle: categories[category]!
          ? const TextStyle(color: Colors.white)
          : const TextStyle(color: Colors.grey),
      backgroundColor: Colors.white,
      selectedColor: Colors.blue,
      shape: const StadiumBorder(side: BorderSide()),
      onSelected: (bool value) {
        setState(() {
          categories[category] = value;
        });
      },
      selected: categories[category]!,
    );
  }
}
