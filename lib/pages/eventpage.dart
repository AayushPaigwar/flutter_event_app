import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/sizedconst.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/apimodel.dart';
import '../provider/apiproviders.dart';

class CustomEventPage extends ConsumerStatefulWidget {
  const CustomEventPage({super.key});

  @override
  ConsumerState<CustomEventPage> createState() => CustomEventPageState();
}

class CustomEventPageState extends ConsumerState<CustomEventPage> {
  @override
  Widget build(BuildContext context) {
    final eventId = ref.watch(eventIdProvider.notifier).state;
    final eventDetailsFuture = ref.watch(eventDetailsProvider(eventId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
      ),
      body: eventDetailsFuture.when(
        data: (eventDetails) => EventDetails(eventDetails: eventDetails),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Text('Error: $error, Stack: $stack'),
      ),
    );
  }
}

class EventDetails extends StatelessWidget {
  final Item eventDetails;

  const EventDetails({super.key, required this.eventDetails});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EventBanner(eventDetails: eventDetails),
            EventInfo(eventDetails: eventDetails),
            buildHeight(10),
            EventDateTime(eventDetails: eventDetails),
            buildHeight(20),
            EventVenue(eventDetails: eventDetails),
            buildHeight(20),
            EventMapLocation(eventDetails: eventDetails),
            buildHeight(20),
            const BookNowButton(),
            buildHeight(20),
            const Text(
              "Suggestion For you",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            buildHeight(10),
            EventSuggestions(eventDetails: eventDetails),
          ],
        ),
      ),
    );
  }
}

class EventBanner extends StatelessWidget {
  final Item eventDetails;

  const EventBanner({super.key, required this.eventDetails});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Image.network(
        eventDetails.bannerUrl.toString(),
        fit: BoxFit.fill,
      ),
    );
  }
}

class EventInfo extends StatelessWidget {
  final Item eventDetails;

  const EventInfo({super.key, required this.eventDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventDetails.eventnameRaw.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    eventDetails.location.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Share button pressed'),
                  ),
                );
              },
              icon: const Icon(Icons.star_border_outlined),
            )
          ],
        ),
      ),
    );
  }
}

class EventDateTime extends StatelessWidget {
  final Item eventDetails;

  const EventDateTime({super.key, required this.eventDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(
              Icons.calendar_month_outlined,
              color: Colors.grey,
            ),
            SizedBox(width: 8),
            Text(
              'Date & Time',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          eventDetails.startTimeDisplay.toString(),
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}

class EventVenue extends StatelessWidget {
  final Item eventDetails;

  const EventVenue({super.key, required this.eventDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: Colors.grey,
            ),
            SizedBox(width: 8),
            Text(
              'Venue',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          eventDetails.venue!.fullAddress.toString(),
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}

class EventMapLocation extends StatelessWidget {
  final Item eventDetails;

  const EventMapLocation({super.key, required this.eventDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(
              Icons.map_outlined,
              color: Colors.grey,
            ),
            SizedBox(width: 8),
            Text(
              'Map Location',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          'Latitude: ${eventDetails.venue!.latitude.toString()}',
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        Text(
          'Longitude: ${eventDetails.venue!.longitude.toString()}',
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}

class BookNowButton extends StatelessWidget {
  const BookNowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60),
      ),
      minWidth: double.infinity,
      height: 45,
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: () {},
      child: const Text(
        'Book Now',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class EventSuggestions extends StatelessWidget {
  final Item eventDetails;

  const EventSuggestions({super.key, required this.eventDetails});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 250,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(2, 0),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    width: 250,
                    child: Image.network(
                      eventDetails.bannerUrl.toString(),
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    eventDetails.eventnameRaw.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    eventDetails.startTimeDisplay.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
