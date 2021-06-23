import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nyong_kopi/model/home_category_model.dart';
import 'package:nyong_kopi/model/menu_model.dart';
import 'package:nyong_kopi/model/recommendation_model.dart';
import 'package:nyong_kopi/pages/detail_screen.dart';

class MobileView extends StatelessWidget {
  const MobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //avatar
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image(
                  image: AssetImage("images/lisa.jpg"),
                  fit: BoxFit.cover,
                  width: 75,
                  height: 75,
                ),
              ),
            ),

            //greetings
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text("Size ${MediaQuery.of(context).size.width}"),
                    Text("Good Morning, Lisa",
                        style: TextStyle(
                          fontFamily: 'baloo',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      "Your Point is 300",
                      style: TextStyle(
                        fontFamily: 'baloo',
                        fontSize: 17,
                      ),
                    )
                  ]),
            ),
          ],
        ),
        SizedBox(
          height: 45,
        ),
        Card(
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: GridView.count(
              primary: false,
              crossAxisCount: 4,
              shrinkWrap: true,
              children: List.generate(hotMenuList.length, (index) {
                final HotMenu hotMenu = hotMenuList[index];
                return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: SizedBox(
                        width: 90,
                        height: 115,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                height: 40,
                                width: 50,
                                child: Image(
                                  image: AssetImage(hotMenu.assetImage),
                                )
                                // Icon(
                                //   Icons.coffee,
                                //   color: Colors.brown,
                                // ),
                                ),
                            Text(
                              hotMenu.name,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ));
              })),
        )
        // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        //   SizedBox(
        //     width: 90,
        //     height: 115,
        //     child: Card(
        //       // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        //       // shadowColor: Colors.amber,
        //       // margin: EdgeInsets.only(left: 5, right: 5),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: [
        //           Container(
        //             height: 50,
        //             width: 50,
        //             child: Icon(
        //               Icons.coffee,
        //               color: Colors.brown,
        //             ),
        //           ),
        //           Text(
        //             "Blended Beverages",
        //             textAlign: TextAlign.center,
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        //   SizedBox(
        //     width: 90,
        //     height: 115,
        //     child: Card(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: [
        //           Container(
        //             height: 50,
        //             width: 50,
        //             child: Icon(
        //               Icons.coffee_maker,
        //               color: Colors.brown,
        //             ),
        //           ),
        //           Text(
        //             "Brewed Coffee",
        //             textAlign: TextAlign.center,
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        //   SizedBox(
        //     width: 90,
        //     height: 115,
        //     child: Card(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: [
        //           Container(
        //             height: 50,
        //             width: 50,
        //             child: Icon(
        //               Icons.coffee,
        //               color: Colors.brown,
        //             ),
        //           ),
        //           Text(
        //             "Espresso Beverages",
        //             textAlign: TextAlign.center,
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        //   SizedBox(
        //     width: 90,
        //     height: 115,
        //     child: Card(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: [
        //           Container(
        //             height: 50,
        //             width: 50,
        //             child: Icon(
        //               Icons.emoji_food_beverage,
        //               color: Colors.brown,
        //             ),
        //           ),
        //           Text(
        //             "Other Beverages",
        //             textAlign: TextAlign.center,
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ]),
        ,
        SizedBox(
          height: 45,
        ),
        Text(
          "Special Promo Just For You",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'baloo',
            fontSize: 20,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 200,
            child: ImageSlideshow(
              // scrollDirection: Axis.horizontal,
              width: double.infinity,
              height: 200,
              initialPage: 0,
              autoPlayInterval: 5000,
              indicatorColor: Colors.blue,
              indicatorBackgroundColor: Colors.grey,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: 100,
                  child: Card(
                    child: Image(
                      image: AssetImage("images/promo.png"),
                      // height: 200,
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  // height: 100,
                  child: Card(
                    child: Image(
                      image: AssetImage("images/promo.png"),
                      // height: 200,
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  // height: 100,
                  child: Card(
                    child: Image(
                      image: AssetImage("images/promo.png"),
                      // height: 200,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Recommendation",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'baloo',
            fontSize: 20,
          ),
        ),
        GridView.count(
          crossAxisCount: 2,
          primary: false,
          shrinkWrap: true,
          children: List.generate(recommendedMenu.length, (index) {
            final MenuModel recommendation = recommendedMenu[index];
            var maxRating = 5;
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DetailScreen(menu: recommendation, heroTag: index.toString(), stock: recommendation.stock,);
                }));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Image(
                              image: AssetImage(recommendation.assetsImage))),
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
            );
          }),
        ),
        // ListView.builder(
        //   physics: NeverScrollableScrollPhysics(),
        //   itemCount: recommendationList.length,
        //   scrollDirection: Axis.vertical,
        //   shrinkWrap: true,
        //   itemBuilder: (context, index) {
        //     final RecommendationBeverages recommendation =
        //         recommendationList[index];
        //     return InkWell(
        // onTap: () {},
        // child: Card(
        //   child: Expanded(
        //     child: Column(
        //       children: [
        //         Image(image: AssetImage(recommendation.assetImage)),
        //         Text(recommendation.name),
        //         Text(recommendation.price),
        //       ],
        //     ),
        //   ),
        // ),
        //     );
        //   },
        // )
      ],
    );
  }
}
