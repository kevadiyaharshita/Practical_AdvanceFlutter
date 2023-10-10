import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:practical_advanceflutter/controller/Youtube_Controller.dart';
import 'package:practical_advanceflutter/utils/MyRoutes.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../controller/YoutubePlayerController.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "YouTube",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        leading: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            // color: Colors.pink,
            image: DecorationImage(
                image: AssetImage('assets/images/logo.png'), fit: BoxFit.cover),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(MyRoutes.searchPage);
              },
              icon: Icon(
                Icons.search,
                size: 30,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 16, 5, 0),
        child: Center(
          child: Consumer<YoutubeController>(builder: (context, p, _) {
            return SingleChildScrollView(
              child: Column(
                  children: (p.ym != null)
                      ? List.generate(
                          p.ym!.length,
                          (index) => Consumer<YoutubeVideoController>(
                                  builder: (context, pro, _) {
                                return Container(
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      YoutubePlayer(
                                        controller: pro.intit_Controller(
                                            id: p.ym![index].id),
                                        showVideoProgressIndicator: true,
                                      ),
                                      Gap(5),
                                      Text(
                                        "${p.ym![index].title}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                );
                              }))
                      : [CircularProgressIndicator()]),
            );
          }),
        ),
      ),
    );
  }
}

// SingleChildScrollView(
// child: Column(
// children: List.generate(p.ym!.length, (index) {
// return GestureDetector(
// onTap: () async {
// Uri uri = Uri(
// scheme: 'https',
// path: 'www.youtube.com/watch?v=2g99hLkMrss',
// );
//
// await launchUrl(uri);
// // YoutubePlayerController _controller =
// //     YoutubePlayerController(
// //   initialVideoId: '${p.ym![index].id}',
// //   flags: YoutubePlayerFlags(
// //     autoPlay: true,
// //     mute: true,
// //   ),
// // );
// },
// child: Container(
// height: 180,
// width: w,
// margin: EdgeInsets.all(10),
// decoration: BoxDecoration(
// color: Colors.pink,
// image: DecorationImage(
// image: NetworkImage(
// p.ym![index].thumbnail['medium']['url'],
// ),
// fit: BoxFit.fill),
// ),
// ),
// );
// })))
