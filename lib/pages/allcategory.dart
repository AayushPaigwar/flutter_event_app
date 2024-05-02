// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/sizedconst.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/apiproviders.dart';

class AllCategory extends ConsumerStatefulWidget {
  const AllCategory({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AllCategoryState();
}

class AllCategoryState extends ConsumerState<AllCategory> {
  @override
  Widget build(BuildContext context) {
    final allCategoryFuture = ref.watch(allcaterogy);
    return allCategoryFuture.when(
      data: (allCategories) => _buildCategoryList(allCategories),
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error, Stack: $stack'),
    );
  }

// widget to display all categories
  Widget _buildCategoryList(allCategories) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: allCategories.item.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  //store evnet id to provider
                  final eventId = allCategories.item[index].eventId.toString();
                  ref.watch(eventIdProvider.notifier).state =
                      int.parse(eventId);

                  //navigate to event page
                  Navigator.pushNamed(
                    context,
                    '/eventpage',
                  );
                  log('Event Id: $eventId');
                },
                child: _buildCategoryItem(allCategories, index),
              );
            },
          ),
        ],
      ),
    );
  }

// widget to display list of category
  Widget _buildCategoryItem(allCategories, index) {
    return Container(
      height: 120,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              _buildImageContainer(allCategories, index),
              buildWidth(10),
              EventDetails(allCategories, index),
            ],
          ),
          Positioned(
            bottom: 5,
            right: 10,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.share,
                    size: 25,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    // Add your share button functionality here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Share button pressed'),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.favorite,
                    size: 25,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    // Add your favorite button functionality here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Favorite button pressed'),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

// widget to display image container
  Widget _buildImageContainer(allCategories, index) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xffF2F2F2),
            Color(0xffF2F2F2),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(
            allCategories.item[index].thumbUrl.toString(),
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

// widget to display event details
class EventDetails extends StatelessWidget {
  final allCategories;
  final int index;

  const EventDetails(this.allCategories, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHeight(5),
        _buildEventText(
          allCategories.item[index].eventnameRaw.toString(),
          18,
          FontWeight.bold,
        ),
        _buildEventText(
          allCategories.item[index].startTimeDisplay.toString(),
          12,
          FontWeight.normal,
        ),
        _buildEventText(
          allCategories.item[index].location.toString(),
          12,
          FontWeight.normal,
        ),
      ],
    );
  }

  Widget _buildEventText(
    String text,
    double fontSize,
    FontWeight fontWeight,
  ) {
    return SizedBox(
      width: 200,
      child: Text(
        maxLines: 1,
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
