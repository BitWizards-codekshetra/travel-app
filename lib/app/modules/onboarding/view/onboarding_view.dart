// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_proj/app/core/theme/base_assets.dart';
import 'package:hackathon_proj/app/modules/ask_ai/view/ask_ai_view.dart';

class OnboardingView extends ConsumerWidget {
  /// TODO add your comment here
  OnboardingView({Key? key}) : super(key: key);

  static const routeName = '/onboarding';

  List<String> imageList = [
    'https://st.depositphotos.com/1158226/1264/i/450/depositphotos_12646625-stock-photo-summer-in-in-the-scotland.jpg',
    'https://static.toiimg.com/photo/msid-94299540,width-96,height-65.cms',
    'https://theplanetd.com/images/hill-stations-near-Delhi-Sangla-1.jpg',
    'https://www.aanavandi.com/blog/wp-content/uploads/2019/08/ksrtc-munnar-Riyas-Paloli%E2%80%8E.jpg',
    'https://www.holidaymonk.com/wp-content/uploads/2023/06/Best-Hill-Stations-in-India.webp'
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            BaseAssets.logo,
            width: MediaQuery.of(context).size.width * 0.5,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: Colors.black,
              height: 1.0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                color: Color(0xFFFCBF49),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.09,
                child: Row(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                          "Get 30% off on hotels (party's on us)",
                          style: GoogleFonts.jomolhari(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Color(0xFF2f2f2f)),
                        )),
                    Spacer(),
                    Image.asset(BaseAssets.gift)
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              FlutterCarousel(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.35,
                  showIndicator: true,
                  slideIndicator: CircularSlideIndicator(),
                ),
                items: [
                  'https://magikindia.com/wp-content/uploads/2015/12/cherai-beach-kochi.jpg',
                  'https://static.toiimg.com/photo/msid-94299540,width-96,height-65.cms',
                  'https://theplanetd.com/images/hill-stations-near-Delhi-Sangla-1.jpg',
                  'https://www.aanavandi.com/blog/wp-content/uploads/2019/08/ksrtc-munnar-Riyas-Paloli%E2%80%8E.jpg',
                  'https://www.holidaymonk.com/wp-content/uploads/2023/06/Best-Hill-Stations-in-India.webp'
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.03),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(i), fit: BoxFit.fill),
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * 0.05,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text:
                                        "Ask AI to plan your trip according to",
                                    style: GoogleFonts.jost(
                                        color: Color(0xFF2f2f2f),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                                TextSpan(
                                    text: " your budget",
                                    style: GoogleFonts.jost(
                                        color: Color(0xFFFAFF00),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500))
                              ])),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.020,
                              ),
                              InkWell(
                                onTap: () {
                                  context.push(AskAiView.routeName);
                                },
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.060,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Color(0xFFFAFF00)),
                                  child: Center(
                                    child: Text(
                                      "AI",
                                      style: GoogleFonts.jost(
                                          color: Color(0xFF2f2f2f),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                child: Text(
                  "Explore Destinations",
                  style: GoogleFonts.jost(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Color(0xFF2f2f2f)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: imageList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.03),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(imageList[index]),
                                fit: BoxFit.fill),
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                child: Text(
                  "Trending Places",
                  style: GoogleFonts.jost(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Color(0xFF2f2f2f)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: imageList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.05),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.03),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(imageList[index]),
                                fit: BoxFit.fill),
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
