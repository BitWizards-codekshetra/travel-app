// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_proj/app/core/theme/base_assets.dart';
import 'package:hackathon_proj/app/modules/ask_ai/model/aski_ai_response/place.dart';
import 'package:hackathon_proj/app/modules/book_hotel/view/book_hotel_view.dart';
import 'package:hackathon_proj/app/modules/home/providers/home_providers.dart';

class PlaceDetailsView extends ConsumerWidget {
  /// TODO add your comment here
  PlaceDetailsView({Key? key, required this.placeDescription})
      : super(key: key);
  Place? placeDescription;
  static const routeName = '/placeDetails';

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
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              'https://magikindia.com/wp-content/uploads/2015/12/cherai-beach-kochi.jpg')),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  placeDescription?.name ?? '',
                  style: GoogleFonts.jetBrainsMono(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  placeDescription?.description ?? '',
                  style: GoogleFonts.kleeOne(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2F2F2F)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      "Budget :",
                      style: GoogleFonts.jetBrainsMono(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    Text(
                      "₹${placeDescription?.budget ?? ref.read(selectedPriceChoiceProvider)}",
                      style: GoogleFonts.jetBrainsMono(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    context.push(BookHotelView.routeName);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Color(0xFFFCBF49)),
                    child: Center(
                      child: Text(
                        "Show Hotels",
                        style: GoogleFonts.jetBrainsMono(
                            color: Color(0xFF2f2f2f), fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Color(0xFFFCBF49)),
                    child: Center(
                      child: Text(
                        "Show on Map",
                        style: GoogleFonts.jetBrainsMono(
                          color: Color(0xFF2f2f2f),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
