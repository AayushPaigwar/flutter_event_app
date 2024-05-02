// import 'dart:convert';

import 'dart:convert';

import 'package:flutter_assignment/model/apimodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

// all category funtion
final allcaterogy = FutureProvider((ref) async {
  final response = await http
      .get(Uri.parse('https://allevents.s3.amazonaws.com/tests/all.json'));
  if (response.statusCode == 200) {
    return allCategoryFromJson(response.body);
  } else {
    throw Exception('Failed to load events');
  }
});

// event details function
final eventDetailsProvider =
    FutureProvider.family<Item, int>((ref, eventId) async {
  final response = await http
      .get(Uri.parse('https://allevents.s3.amazonaws.com/tests/all.json'));
  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final events = AllCategory.fromJson(jsonResponse).item;

    final event = events.firstWhere(
        (element) => element.eventId == eventId.toString(),
        orElse: () => throw Exception('Event not found'));
    return event;
  } else {
    throw Exception('Failed to fetch event details');
  }
});

// event id provider
final eventIdProvider = StateProvider<int>((ref) => 0);
