// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_proj/app/core/theme/base_assets.dart';
import 'package:hackathon_proj/app/modules/book_hotel/providers/book_hotel_providers.dart';

class HotelDetailView extends ConsumerWidget {
  HotelDetailView({Key? key}) : super(key: key);
  static const routeName = '/hotelDetail';

  List<String> hotelList = [
    'https://www.wyndhamhotels.com/content/dam/creative-images/apac/text/3x2/Peninsula%20Excelsior%20Singapore,%20a%20Wyndham%20Hotel.jpg',
    'https://assets-global.website-files.com/5c6d6c45eaa55f57c6367749/65045f093c166fdddb4a94a5_x-65045f0266217.webp',
    'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/22/00/50/fd/hotel-colline-de-france.jpg?w=500&h=400&s=1',
    'https://www.tajhotels.com/content/dam/luxury/hotels/Taj_Lands_End_Mumbai/images/4x3/R&S_WOGLI_Exterior-Master.jpg'
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noOfRooms = ref.watch(numberOfRooms);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              context.pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.01,
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill, image: NetworkImage(hotelList[0])),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      )),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.30,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hotelList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.01,
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.30,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFF2F2F2F)),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(hotelList[index])),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Wifi Avaliability : ",
                          style: GoogleFonts.jetBrainsMono(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        Spacer(),
                        Text(
                          "Yes",
                          style: GoogleFonts.jetBrainsMono(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          "Price : ",
                          style: GoogleFonts.jetBrainsMono(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        Spacer(),
                        Text(
                          "₹4999",
                          style: GoogleFonts.jetBrainsMono(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          "Number of Rooms",
                          style: GoogleFonts.jetBrainsMono(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            if (noOfRooms > 1) {
                              ref.read(numberOfRooms.notifier).state =
                                  ref.read(numberOfRooms) - 1;
                            }
                          },
                          child: PhysicalModel(
                            elevation: 3,
                            color: Colors.blueGrey,
                            shape: BoxShape.circle,
                            child: CircleAvatar(
                              backgroundColor: Color(0xFFFCBF49),
                              radius: MediaQuery.of(context).size.width * 0.035,
                              child: Icon(
                                Icons.remove,
                                color: Color(0xFF2F2F2F),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        Text(
                          "$noOfRooms",
                          style: GoogleFonts.jetBrainsMono(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        InkWell(
                          onTap: () {
                            ref.read(numberOfRooms.notifier).state =
                                ref.read(numberOfRooms) + 1;
                          },
                          child: PhysicalModel(
                            elevation: 3,
                            color: Colors.blueGrey,
                            shape: BoxShape.circle,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: MediaQuery.of(context).size.width * 0.035,
                              child: Icon(
                                Icons.add,
                                color: Color(0xFF2F2F2F),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      "Booking Dates",
                      style: GoogleFonts.jetBrainsMono(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "From",
                              style: GoogleFonts.jetBrainsMono(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.height * 0.01,
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blueGrey, blurRadius: 4),
                                  ],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                                      style: GoogleFonts.jetBrainsMono(
                                          color: Color(0xFF2F2F2F),
                                          fontSize: 16),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.calendar_month,
                                      color: Colors.black,
                                    )
                                  ],
                                ))
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "To",
                              style: GoogleFonts.jetBrainsMono(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.height * 0.01,
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.blueGrey, blurRadius: 4),
                                  ],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                                      style: GoogleFonts.jetBrainsMono(
                                          color: Color(0xFF2F2F2F),
                                          fontSize: 16),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.calendar_month,
                                      color: Colors.black,
                                    )
                                  ],
                                )),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                        ),
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Color(0xFFFCBF49)),
                        child: Center(
                          child: Row(
                            children: [
                              Text(
                                "Book Hotel",
                                style: GoogleFonts.jetBrainsMono(
                                    color: Color(0xFF2f2f2f)),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_forward,
                                  color: Color(0xFF2f2f2f))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
