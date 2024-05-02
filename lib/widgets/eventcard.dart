// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class EventCard extends StatelessWidget {
//   const EventCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 8.0),
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: const Column(
//         children: [
//           EventCardRow(),
//         ],
//       ),
//     );
//   }
// }

// class EventCardRow extends StatelessWidget {
//   const EventCardRow({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Row(
//       children: [
//         EventImage(),
//         EventDetails(),
//       ],
//     );
//   }
// }

// class EventImage extends ConsumerWidget {
//   const EventImage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Container(
//       height: 150,
//       width: 120,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         image: const DecorationImage(
//           image: NetworkImage(
//               'https://img.pikbest.com/origin/06/28/80/395pIkbEsTiRb.jpg!w700wp'),
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }

// class EventDetails extends StatelessWidget {
//   const EventDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           EventInfo(),
//           EventActions(),
//         ],
//       ),
//     );
//   }
// }

// class EventInfo extends StatelessWidget {
//   const EventInfo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Night Music Friday',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Text(
//           '10th July 2021',
//           style: TextStyle(
//             fontSize: 14,
//             color: Colors.grey,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Text(
//           'Date',
//           style: TextStyle(
//             fontSize: 14,
//             color: Colors.grey,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class EventActions extends StatelessWidget {
//   const EventActions({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         AttendeesInfo(),
//         ShareButton(),
//         FavoriteButton(),
//       ],
//     );
//   }
// }

// class AttendeesInfo extends StatelessWidget {
//   const AttendeesInfo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
//       decoration: BoxDecoration(
//         color: Colors.deepPurple.shade100,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: const Row(
//         children: [
//           ProfileImage(),
//           SizedBox(width: 8),
//           Text('+100',
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               )),
//         ],
//       ),
//     );
//   }
// }

// class ProfileImage extends StatelessWidget {
//   const ProfileImage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 30,
//       width: 30,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(50),
//         image: const DecorationImage(
//           image: NetworkImage(
//               'https://img.pikbest.com/origin/06/28/80/395pIkbEsTiRb.jpg!w700wp'),
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }

// class ShareButton extends StatelessWidget {
//   const ShareButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: () {},
//       icon: const Icon(Icons.share),
//     );
//   }
// }

// class FavoriteButton extends StatelessWidget {
//   const FavoriteButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: () {},
//       icon: const Icon(Icons.star_border_outlined),
//     );
//   }
// }
