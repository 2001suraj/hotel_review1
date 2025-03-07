// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_app/business_logic/hotel/hotel_bloc.dart';
import 'package:review_app/data/model/hotel_model.dart';
import 'package:review_app/presentation/screens/Advanture/advanture_screen.dart';
import 'package:review_app/presentation/screens/Near_you/near_you_screen.dart';
import 'package:review_app/presentation/screens/home/components/custom_drawer.dart';
import 'package:review_app/presentation/screens/home/components/single_page.dart';
import 'package:review_app/presentation/screens/home/components/slider_container.dart';
import 'package:review_app/presentation/screens/popular/popular_screen.dart';
import 'package:review_app/presentation/widgets/custom_row.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';
  HomeScreen({Key? key}) : super(key: key);
  List<String> items = [
    'Popular',
    'Advanture',
    'Near You',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search)), IconButton(onPressed: () {}, icon: Icon(Icons.notifications))],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SliderContainer(),
            CustomRow(text1: 'Explore Restaurant', text2: 'View all', tap: () {}),
            Container(
              margin: EdgeInsets.all(15),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Center(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'All Restaurant',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if (items[index].contains('Popular')) {
                            Navigator.pushReplacementNamed(context, PopularScreen.routeName, arguments: PopularScreen(type: items[index]));
                            context.read<HotelBloc>().add(GetPopularHotelEvent(name: items[index]));
                          }
                          if (items[index].contains('Near You')) {
                            Navigator.pushReplacementNamed(context, NearYouScreen.routeName, arguments: NearYouScreen(type: 'Near You'));
                            context.read<HotelBloc>().add(GetNearyouHotelEvent(name: 'Near You'));
                          }
                          if (items[index].contains('Advanture')) {
                            Navigator.pushReplacementNamed(context, AdvantureScreen.routeName, arguments: AdvantureScreen(type: 'Advanture'));
                            context.read<HotelBloc>().add(GetAdvantureHotelEvent(name: 'Advanture'));
                          }
                        },
                        child: Center(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                items[index].toString(),
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            IndividualHotel(),
          ],
        ),
      ),
    );
  }
}

class IndividualHotel extends StatefulWidget {
  const IndividualHotel({
    Key? key,
  }) : super(key: key);

  @override
  State<IndividualHotel> createState() => _IndividualHotelState();
}

class _IndividualHotelState extends State<IndividualHotel> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<HotelBloc>().add(GetHotelEvent());
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelBloc, HotelState>(
      builder: (context, state) {
        if (state is HotelInitial) {
          context.read<HotelBloc>().add(GetHotelEvent());
        } else if (state is HotelloadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is Hotelloadedstate) {
          List<HotelModel> info = state.hotel;

          log(" log => ${info.length}");

          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.horizontal,
              itemCount: info.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      SinglePage.routeName,
                      arguments: SinglePage(
                          lat: info[index].lat,
                          features: info[index].features,
                          lng: info[index].lng,
                          des: info[index].des,
                          image: info[index].image,
                          location: info[index].location,
                          name: info[index].name,
                          amenities: info[index].amenities
                          // rating: info[index].rating,
                          ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 300,
                        width: 250,
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.all(15),
                        decoration: (BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: NetworkImage(info[index].image), fit: BoxFit.cover),
                        )),
                      ),
                      Container(
                        height: 300,
                        width: 250,
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.all(15),
                        decoration: (BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black.withOpacity(0.5),
                        )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //name
                            Text(
                              info[index].name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //des
                            Text(
                              info[index].des,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            //row  of location price rating
                            FittedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      SizedBox(
                                        width: 120,
                                        child: Text(
                                          info[index].location,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        '( ${info[index].rating} )',
                                        style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else if (state is HotelfailureState) {
          return Text(state.message);
        }
        return Container();
      },
    );
  }
}
