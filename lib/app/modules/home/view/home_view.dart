// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hackathon_proj/app/core/theme/app_theme.dart';
import 'package:hackathon_proj/app/modules/home/providers/home_providers.dart';
import 'package:hackathon_proj/app/modules/place_details/view/place_details_view.dart';
import 'package:hackathon_proj/app/modules/profile/view/profile_view.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routeName = '/home';
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  List<String> imagesList = [
    'https://i.pinimg.com/originals/d3/45/11/d3451114ab4e1d55ead624930bcff60c.jpg',
    'https://t4.ftcdn.net/jpg/03/04/37/91/240_F_304379136_TaU4VZ0dnwBd8ImND3bGAwCEdcZ2PcZj.jpg',
    'https://t3.ftcdn.net/jpg/02/16/19/56/240_F_216195684_CgOPhTnGiqTBZW1OT1WxaVFc6oEWBA7E.jpg',
    'https://t4.ftcdn.net/jpg/02/25/98/29/240_F_225982943_eZYwYAoACnfhZnoi1rv54JCv2lZd3EtX.jpg',
    'https://t4.ftcdn.net/jpg/03/23/89/13/240_F_323891347_Y0RF7AExyCjyFtZWZYhmhkIdYDUmRmNq.jpg',
    'https://t3.ftcdn.net/jpg/00/23/37/30/240_F_23373041_p1a7TfakMOYC9GF7odPyAakKaW9ww7hc.jpg',
    'https://t4.ftcdn.net/jpg/00/74/05/89/240_F_74058991_bpE2mONOZG6esm2wbsXAs87PV6bstgnK.jpg',
  ];

  List<String> placeOptions = [
    'hills stations',
    'beaches',
    'forests',
    'historical places',
    'mountains'
  ];
  @override
  void initState() {
    // Future.delayed(Duration(seconds: 1), () {
    //   showCustomDialog(context);
    // });
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final appTheme = ref.read(appThemeProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.lightTheme.primaryColor,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          leading: Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
            child: InkWell(
              onTap: () {
                context.push(ProfileView.routeName);
              },
              child: CircleAvatar(
                backgroundColor: appTheme.darkTheme.primaryColor,
                radius: MediaQuery.of(context).size.width * 0.9,
                child: Image.network(
                    'https://imgs.search.brave.com/B1ZhL7CyFQbqRRXYtHKMXvtu0B9RRJWFhkT7Ugdm7tE/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9jZG4t/aWNvbnMtcG5nLmZs/YXRpY29uLmNvbS8x/MjgvMTE0NzIvMTE0/NzI3ODMucG5n'),
              ),
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Hello, User",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.010,
                )
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Places for you",
                style: TextStyle(
                    color: Color(0xFF2f2F2f),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.23,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imagesList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        context.push(PlaceDetailsView.routeName);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.05,
                        ),
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.145,
                              width: MediaQuery.of(context).size.width * 0.45,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                        imagesList[index],
                                      )),
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12),
                                  )),
                            ),
                            Text(
                              "Title",
                              style: TextStyle(
                                  color: Color(0xFF2f2F2f),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.02),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.green[900],
                                  ),
                                  Spacer(),
                                  Text(
                                    "XYZ Location",
                                    style: TextStyle(
                                        color: Color(0xFF2f2F2f),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.02),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "₹6000",
                                    style: TextStyle(
                                        color: Colors.green[700],
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                  Spacer(),
                                  Text(
                                    "₹8000",
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Color(0xFF2f2F2f),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                "Unheared & Undiscovered",
                style: TextStyle(
                    color: Color(0xFF2f2F2f),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.23,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imagesList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.05,
                      ),
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.145,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      imagesList[index],
                                    )),
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12),
                                )),
                          ),
                          Text(
                            "Title",
                            style: TextStyle(
                                color: Color(0xFF2f2F2f),
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.02),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.green[900],
                                ),
                                Spacer(),
                                Text(
                                  "XYZ Location",
                                  style: TextStyle(
                                      color: Color(0xFF2f2F2f),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.02),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "₹6000",
                                  style: TextStyle(
                                      color: Colors.green[700],
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                Spacer(),
                                Text(
                                  "₹8000",
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Color(0xFF2f2F2f),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                "Hottest Destinations",
                style: TextStyle(
                    color: Color(0xFF2f2F2f),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Wrap(
                alignment: WrapAlignment.start,
                spacing: MediaQuery.of(context).size.width * 0.01,
                runSpacing: MediaQuery.of(context).size.width * 0.02,
                children: [
                  for (int i = 0; i < imagesList.length; i++)
                    Container(
                      height: MediaQuery.of(context).size.height * 0.23,
                      width: MediaQuery.of(context).size.width * 0.44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.145,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      imagesList[i],
                                    )),
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12),
                                )),
                          ),
                          Text(
                            "Title",
                            style: TextStyle(
                                color: Color(0xFF2f2F2f),
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.02),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.green[900],
                                ),
                                Spacer(),
                                Text(
                                  "XYZ Location",
                                  style: TextStyle(
                                      color: Color(0xFF2f2F2f),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.02),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "₹6000",
                                  style: TextStyle(
                                      color: Colors.green[700],
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                Spacer(),
                                Text(
                                  "₹8000",
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Color(0xFF2f2F2f),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                "Historical Places",
                style: TextStyle(
                    color: Color(0xFF2f2F2f),
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.23,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imagesList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.05,
                      ),
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(imagesList[index])),
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12))),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.005),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_city,
                                      color: Colors.black,
                                      size: 19,
                                    ),
                                    Spacer(),
                                    Text(
                                      "Title",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF191717)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.black,
                                      size: 19,
                                    ),
                                    Spacer(),
                                    Text(
                                      "XYZ Location",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF191717)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.currency_rupee,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                    Spacer(),
                                    Text(
                                      "₹4500 Approx",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF191717)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
        )),
      ),
    );
  }

  void showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: 240,
            child: SizedBox.expand(child: FlutterLogo()),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(40)),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: Consumer(builder: (context, ref, widget) {
              final appTheme = ref.read(appThemeProvider);
              final choiceSelected = ref.watch(selectedChoiceProvider);
              return Wrap(
                alignment: WrapAlignment.center,
                spacing: MediaQuery.of(context).size.width * 0.05,
                runSpacing: MediaQuery.of(context).size.height * 0.04,
                children: [
                  for (int i = 0; i < placeOptions.length; i++)
                    ChoiceChip(
                        backgroundColor: Colors.white,
                        selectedColor: appTheme.lightTheme.primaryColor,
                        onSelected: (value) async {
                          ref
                              .read(selectedChoiceProvider.notifier)
                              .selectCategories(
                                placeOptions[i],
                              );
                        },
                        label: Text(
                          placeOptions[i],
                          style: TextStyle(
                              color: choiceSelected == placeOptions[i]
                                  ? Colors.white
                                  : Colors.black),
                        ),
                        selected: choiceSelected == placeOptions[i]),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
