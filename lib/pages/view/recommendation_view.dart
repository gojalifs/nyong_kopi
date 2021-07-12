import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nyong_kopi/model/menu_model.dart';
import 'package:nyong_kopi/model/recommendation_model.dart';
import 'package:nyong_kopi/pages/detail_screen.dart';

class RecommendationGridView extends StatelessWidget {
  final int gridCount;

  RecommendationGridView({required this.gridCount});

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
                  children: [
                    Expanded(
                        child: Center(
                          child: Image(
                              image: AssetImage(recommendation.assetsImage)),
                        )),
                    Text(
                      recommendation.menuName,
                      style: TextStyle(
                          fontFamily: 'baloo',
                          fontWeight: FontWeight.bold,
                          fontSize: 17.5),
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Rp' + recommendation.price.toString()),
                        Row(
                          children: [
                            RatingBar.builder(
                                ignoreGestures: true,
                                glowColor: Colors.black,
                                itemSize: 15,
                                allowHalfRating: true,
                                initialRating: recommendation.rating,
                                itemBuilder: (context, _) {
                                  return Icon(
                                    Icons.star,
                                    size: 1,
                                    color: Theme.of(context).primaryColor,
                                  );
                                },
                                onRatingUpdate: (rating) {
                                  print(rating);
                                }),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                recommendation.rating.toString() +
                                    '/' +
                                    maxRating.toString(),
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12.5),
                              ),
                            ),
                          ],
                        ),
                      ],
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
