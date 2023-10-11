import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:practical_advanceflutter/controller/Youtube_Controller.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../controller/YoutubePlayerController.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 16, 5, 0),
        child: Center(
          child: Consumer<YoutubeController>(builder: (context, p, _) {
            return Column(
              children: [
                Gap(30),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                          color: Colors.grey,
                        )),
                    Expanded(
                      child: Container(
                        height: 45,
                        child: TextField(
                          onSubmitted: (val) {
                            p.getSearchData(query: val.toString());
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            hintText: "Search YouTube here.",
                            hintStyle:
                                TextStyle(color: Colors.grey.withOpacity(0.5)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(80),
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(80),
                                borderSide: BorderSide(
                                    color: Colors.grey.withOpacity(0.5))),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(80),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gap(15),
                    Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.1)),
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.mic))),
                  ],
                ),
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: (p.searchym != null)
                            ? List.generate(
                                p.searchym!.length,
                                (index) => Consumer<YoutubeVideoController>(
                                        builder: (context, pro, _) {
                                      return Container(
                                        margin: EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            YoutubePlayer(
                                              controller: pro.intit_Controller(
                                                  id: p.searchym![index].id),
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
                                              progressIndicatorColor:
                                                  Colors.red,
                                              progressColors: ProgressBarColors(
                                                  playedColor: Colors.red,
                                                  bufferedColor: Colors.grey,
                                                  backgroundColor: Colors.grey
                                                      .withOpacity(0.5),
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
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: IconButton(
                                                    onPressed: () {
                                                      showModalBottomSheet(
                                                        context: context,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        builder: (context) =>
                                                            Container(
                                                          height: 350,
                                                          width:
                                                              double.infinity,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  18),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                                        fontSize:
                                                                            18),
                                                                  )
                                                                ],
                                                              ),
                                                              Gap(20),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .access_time,
                                                                    // size: 30,
                                                                  ),
                                                                  Gap(25),
                                                                  Text(
                                                                    "Svae to watch later",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18),
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
                                                                        fontSize:
                                                                            18),
                                                                  )
                                                                ],
                                                              ),
                                                              Gap(20),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                      CupertinoIcons
                                                                          .share
                                                                      // size: 30,
                                                                      ),
                                                                  Gap(25),
                                                                  Text(
                                                                    "Share",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18),
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
                                                                        fontSize:
                                                                            18),
                                                                  )
                                                                ],
                                                              ),
                                                              Gap(20),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                      CupertinoIcons
                                                                          .person_crop_circle_badge_xmark
                                                                      // size: 30,
                                                                      ),
                                                                  Gap(25),
                                                                  Text(
                                                                    "Not interested",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18),
                                                                  )
                                                                ],
                                                              ),
                                                              Gap(20),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                      CupertinoIcons
                                                                          .flag_fill
                                                                      // size: 30,
                                                                      ),
                                                                  Gap(25),
                                                                  Text(
                                                                    "Report",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18),
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
                            : [
                                Center(
                                  child: Transform.scale(
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/Search engines-bro.png'),
                                    ),
                                    scale: 0.8,
                                  ),
                                ),
                              ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
