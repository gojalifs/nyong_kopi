import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:nyong_kopi/pages/view/recommendation_view.dart';

class HomeScreen extends StatefulWidget {
  final int gridCount;

  const HomeScreen({Key? key, required this.gridCount}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var greetings;

  @override
  void initState() {
    super.initState();
    if (DateTime.now().hour <= 10) {
      setState(() {
        greetings = 'Morning';
      });
    } else if (DateTime.now().hour <= 15) {
      setState(() {
        greetings = 'Afternoon';
      });
    } else if (DateTime.now().hour <= 20) {
      setState(() {
        greetings = 'Evening';
      });
    } else {
      setState(() {
        greetings = 'Night';
      });
    }
  }

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
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Good $greetings, Lisa",
                        style: TextStyle(
                          fontFamily: 'baloo',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )),
                  ]),
            ),
          ],
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
          padding: EdgeInsets.all(10),
          child: Container(
            height: 200,
            child: ImageSlideshow(
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
        RecommendationGridView(gridCount: widget.gridCount),
      ],
    );
  }
}
