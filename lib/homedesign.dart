import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pharmatiq/NavDrawer.dart';
import 'package:pharmatiq/homedesign2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pharmatiq/signup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmatiq/notification_button.dart';

class DashboardPage extends StatefulWidget {
  final String uid;

  DashboardPage({Key key, @required this.uid}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState(uid);
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  final String uid;
  _DashboardPageState(this.uid);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('PHARMATIq',style:GoogleFonts.ptSansCaption(textStyle:TextStyle(color: Colors.white),fontWeight:FontWeight.w500,fontSize: 27.0)),backgroundColor: Color.fromRGBO(0, 170, 140, 1),
        actions: <Widget>[
          //IconButton(icon:Icon( Icons.notifications_none,color:Colors.white), onPressed:(){}),
          NotificationButton(),
          IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,),onPressed: null)


        ],
      ),
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.all(1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //children: <Widget>[
            //InkWell(child: Text('')),
            //Container(
            //height: 50.0,
            //width: 50.0,
            //)
            //],
          ),
        ),
        //Padding(
          //padding: const EdgeInsets.only(left: 15.0),
          //child: Text(
            //'DELIVERY',
            //style: GoogleFonts.notoSans(
              //  fontWeight: FontWeight.w800, fontSize: 27.0),
          //),
        //),

        SizedBox(height: 25.0),
        Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
                padding: EdgeInsets.only(left: 5.0),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(40.0)),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: GoogleFonts.notoSans(fontSize: 14.0),
                      border: InputBorder.none,
                      fillColor: Colors.grey.withOpacity(0.5),
                      prefixIcon: Icon(Icons.search, color: Colors.grey)),
                ))),
        SizedBox(height: 17.0),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'Categories',
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w800, fontSize: 21.0),
          ),
        ),
        SizedBox(height: 22.0),
        Container(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildListItem('Tablets', 'images/pills.png',
                    Color.fromRGBO(0, 170, 140, 6), Colors.white),
                _buildListItem('Syrups', 'images/syrup.png',
                    Color.fromRGBO(0, 170, 140, 6), Colors.white),
                //Color(0xFFD7FADA), Colors.white),
                _buildListItem('Covid essentials', 'images/mask (1).png',
                    Color.fromRGBO(0, 170, 140, 6), Colors.white),
                _buildListItem('Others', 'images/flutother.png',
                    Color(0xFFD7FADA), Colors.white),
              ],
            )),
        SizedBox(height: 30.0),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'Special Offers',
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w800, fontSize: 21.0),
          ),
        ),
        SizedBox(height: 25.0),
        CarouselSlider(
            options: CarouselOptions(height: 230,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8

            ),
            items: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    image: DecorationImage(
                        image: AssetImage('images/flutpost1.png'),
                        fit: BoxFit.cover
                    )
                ),
              )
            ]
        )

      ]),
    );
  }

  _buildListItem(String category, String imgPath, Color bgColor,
      Color textColor) {
    if (category == "Tablets") {
      return Padding(
          padding: EdgeInsets.only(left: 15.0),
          child:
          InkWell(
              onTap: () {
                //ToDo
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => listproduct()
                ));
              },
              child: Container(
                  height: 175.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: bgColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Hero(
                          tag: category,
                          child: Container(
                              height: 75.0,
                              width: 75.0,
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Center(
                                  child: Image.asset(imgPath,
                                      height: 50.0, width: 50.0)))),
                      SizedBox(height: 25.0),
                      Text(
                        category,
                        style: GoogleFonts.notoSans(
                            fontSize: 17.0, color: textColor),
                      ),

                    ],
                  ))));
    }
    else {
      return Padding(
          padding: EdgeInsets.only(left: 15.0),
          child:
          InkWell(
              onTap: () {
                //ToDo
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignHome()
                ));
              },
              child: Container(
                  height: 175.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: bgColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Hero(
                          tag: category,
                          child: Container(
                              height: 75.0,
                              width: 75.0,
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Center(
                                  child: Image.asset(imgPath,
                                      height: 50.0, width: 50.0)))),
                      SizedBox(height: 25.0),
                      Text(
                        category,
                        style: GoogleFonts.notoSans(
                            fontSize: 17.0, color: textColor),
                      ),

                    ],
                  ))));
    }
  }}
