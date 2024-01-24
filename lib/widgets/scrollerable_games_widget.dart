import 'package:flutter/material.dart';
import 'package:game_app_ui/data.dart';

class ScrollableGamesWidget extends StatelessWidget {
  final double height;
  final double width;
  final bool showTitle;
  final List<Game> gamesData;

  const ScrollableGamesWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.showTitle,
      required this.gamesData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: gamesData.map((_game) {
          return Container(
            height: height,
            width: width*0.30,
            padding: EdgeInsets.only(right: width*0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.60,
                  width: width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(_game.coverImage.url),
                    ),
                  ),
                ),
              showTitle?  Text(
                _game.title,
                maxLines: 2,
                style:  TextStyle(fontSize:height*0.07,color:Colors.white,fontWeight: FontWeight.bold),
              ):Container(),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
