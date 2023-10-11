import 'package:flutter/cupertino.dart';
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
        title: Transform.scale(
          scaleY: 1.8,
          child: Text(
            "YouTube",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: -0.8),
          ),
        ),
        // backgroundColor: Colors.white,
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
        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
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
                                        bottomActions: [
                                          CurrentPosition(),
                                          ProgressBar(isExpanded: true),
                                          PlayPauseButton(),
                                          PlaybackSpeedButton(),
                                          FullScreenButton(

                                              // controller: pro.getContoller,
                                              ),
                                        ],
                                        showVideoProgressIndicator: true,
                                        progressIndicatorColor: Colors.red,
                                        progressColors: ProgressBarColors(
                                            playedColor: Colors.red,
                                            bufferedColor: Colors.grey,
                                            backgroundColor:
                                                Colors.grey.withOpacity(0.5),
                                            handleColor: Colors.red),
                                      ),
                                      Gap(5),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Text(
                                                "${p.ym![index].title}",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: IconButton(
                                              onPressed: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  builder: (context) =>
                                                      Container(
                                                    height: 350,
                                                    width: w,
                                                    padding: EdgeInsets.all(18),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .queue_music_rounded,
                                                              // size: 30,
                                                            ),
                                                            Gap(25),
                                                            Text(
                                                              "Play next in queue",
                                                              style: TextStyle(
                                                                  fontSize: 18),
                                                            )
                                                          ],
                                                        ),
                                                        Gap(20),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.access_time,
                                                              // size: 30,
                                                            ),
                                                            Gap(25),
                                                            Text(
                                                              "Svae to watch later",
                                                              style: TextStyle(
                                                                  fontSize: 18),
                                                            )
                                                          ],
                                                        ),
                                                        Gap(20),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .folder_special_rounded,
                                                              // size: 30,
                                                            ),
                                                            Gap(25),
                                                            Text(
                                                              "Svae to plalist",
                                                              style: TextStyle(
                                                                  fontSize: 18),
                                                            )
                                                          ],
                                                        ),
                                                        Gap(20),
                                                        Row(
                                                          children: [
                                                            Icon(CupertinoIcons
                                                                    .share
                                                                // size: 30,
                                                                ),
                                                            Gap(25),
                                                            Text(
                                                              "Share",
                                                              style: TextStyle(
                                                                  fontSize: 18),
                                                            )
                                                          ],
                                                        ),
                                                        Gap(20),
                                                        Row(
                                                          children: [
                                                            Icon(Icons
                                                                    .not_interested
                                                                // size: 30,
                                                                ),
                                                            Gap(25),
                                                            Text(
                                                              "Not interested",
                                                              style: TextStyle(
                                                                  fontSize: 18),
                                                            )
                                                          ],
                                                        ),
                                                        Gap(20),
                                                        Row(
                                                          children: [
                                                            Icon(CupertinoIcons
                                                                    .person_crop_circle_badge_xmark
                                                                // size: 30,
                                                                ),
                                                            Gap(25),
                                                            Text(
                                                              "Not interested",
                                                              style: TextStyle(
                                                                  fontSize: 18),
                                                            )
                                                          ],
                                                        ),
                                                        Gap(20),
                                                        Row(
                                                          children: [
                                                            Icon(CupertinoIcons
                                                                    .flag_fill
                                                                // size: 30,
                                                                ),
                                                            Gap(25),
                                                            Text(
                                                              "Report",
                                                              style: TextStyle(
                                                                  fontSize: 18),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                              icon: Icon(Icons.more_vert),
                                            ),
                                          ),
                                        ],
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
