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
                Gap(50),
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
                        height: 50,
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
                                        child: YoutubePlayer(
                                          controller: pro.intit_Controller(
                                              id: p.searchym![index].id),
                                          showVideoProgressIndicator: true,
                                        ),
                                      );
                                    }))
                            : [Center(child: Text('Search Your Videos..'))],
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
