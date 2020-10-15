// import 'package:flutter/material.dart';
//
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
//
//
// class AtrocityVideo extends StatefulWidget {
//   final AtrocityVideo _atrocityVideo;
//
//
//
//
//   @override
//   _AtrocityVideoState createState() => _AtrocityVideoState();
// }
//
// class _AtrocityVideoState extends State<AtrocityVideo> {
//
//   YoutubePlayerController _controller = YoutubePlayerController(
//     initialVideoId: widget.atrocity,
//     flags: YoutubePlayerFlags(
//       autoPlay: true,
//       mute: true,
//     ),
//   );
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return YoutubePlayerBuilder(
//         player: YoutubePlayer(
//         controller: _controller,
//         bottomActions: [
//           CurrentPosition(),
//           ProgressBar(isExpanded: true),
//
//     ],
//     ),
//     builder: (context, player) {
//       return Column(
//         children: [
//           // some widgets
//           player,
//
//           //some other widgets
//         ],
//       );
//     });
//
//   }
// }
