// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_proj/app/core/theme/base_assets.dart';
import 'package:hackathon_proj/app/modules/book_hotel/view/hotel_details.dart';

class BookHotelView extends ConsumerWidget {
  /// TODO add your comment here
  BookHotelView({Key? key}) : super(key: key);

  static const routeName = '/bookHotel';

  List<String> hotelList = [
    'https://www.wyndhamhotels.com/content/dam/creative-images/apac/text/3x2/Peninsula%20Excelsior%20Singapore,%20a%20Wyndham%20Hotel.jpg',
    'https://assets-global.website-files.com/5c6d6c45eaa55f57c6367749/65045f093c166fdddb4a94a5_x-65045f0266217.webp',
    'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/22/00/50/fd/hotel-colline-de-france.jpg?w=500&h=400&s=1',
    'https://www.tajhotels.com/content/dam/luxury/hotels/Taj_Lands_End_Mumbai/images/4x3/R&S_WOGLI_Exterior-Master.jpg'
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView.builder(
                  itemCount: hotelList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.01,
                          horizontal: MediaQuery.of(context).size.width * 0.05,
                        ),
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: MediaQuery.of(context).size.width * 1,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(hotelList[index])),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              20,
                            ),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            onTap: () {
                              context.push(HotelDetailView.routeName);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.01,
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  color: Color(0xFFFCBF49)),
                              child: Center(
                                child: Row(
                                  children: [
                                    Text(
                                      "₹4999 Per night",
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
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
