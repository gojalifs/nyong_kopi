import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:nyong_kopi/model/menu_model.dart';
import 'package:nyong_kopi/model/recommendation_model.dart';
import 'package:nyong_kopi/pages/detail_screen.dart';

class RecommendationGridView extends StatelessWidget {
  final int gridCount;

  RecommendationGridView({required this.gridCount});

  final formatter = NumberFormat("#,###");

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: gridCount,
      primary: false,
      shrinkWrap: true,
      children: List.generate(recommendedMenu.length, (index) {
        final MenuModel recommendation = recommendedMenu[index];
        var maxRating = 5;
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(
                menu: recommendation,
                heroTag: index.toString(),
                stock: recommendation.stock,
              );
            }));
          },
          child: Hero(
            tag: index.toString(),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: Image(
                          image: AssetImage(recommendation.assetsImage),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        recommendation.menuName,
                        style: TextStyle(
                          fontFamily: 'baloo',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          overflow: TextOverflow.ellipsis,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Text(
                                'Rp' +
                                    formatter
                                        .format(recommendation.price)
                                        .toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                )),
                          ),
                          Flexible(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MediaQuery.of(context).size.width >= 500
                                    ? Expanded(
                                        child: RatingBar.builder(
                                            ignoreGestures: true,
                                            glowColor: Colors.black,
                                            itemSize: 10,
                                            allowHalfRating: true,
                                            initialRating:
                                                recommendation.rating,
                                            itemBuilder: (context, _) {
                                              return Icon(
                                                Icons.star,
                                                size: 1,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              );
                                            },
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            }),
                                      )
                                    : SizedBox.shrink(),
                                Text(
                                  recommendation.rating.toString() +
                                      '/' +
                                      maxRating.toString(),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
