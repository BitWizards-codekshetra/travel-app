// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_proj/app/core/theme/base_assets.dart';
import 'package:hackathon_proj/app/modules/ask_ai/providers/ask_ai_providers.dart';
import 'package:hackathon_proj/app/modules/home/providers/home_providers.dart';
import 'package:hackathon_proj/app/modules/place_details/view/place_details_view.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routeName = '/home';
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final choiceSelected = ref.watch(selectedChoiceProvider);

    final priceChoice = ref.watch(selectedPriceChoiceProvider);
    final travelChoice = ref.watch(selectedTransportChoiceProvider);

    final askAiAsync = ref.watch(AskAiProvider(
        budget: priceChoice,
        place: choiceSelected,
        travelOption: travelChoice));
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
          body: askAiAsync.when(
              data: (data) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                      vertical: MediaQuery.of(context).size.height * 0.01,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "Recommended by AI",
                            style: GoogleFonts.kleeOne(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF2F2F2F)),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Wrap(
                          alignment: WrapAlignment.start,
                          spacing: MediaQuery.of(context).size.width * 0.02,
                          runSpacing: MediaQuery.of(context).size.height * 0.01,
                          children: [
                            for (int i = 0; i < data.places!.length; i++)
                              InkWell(
                                onTap: () {
                                  context.push(PlaceDetailsView.routeName,
                                      extra: data.places?[i]);
                                },
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.43,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.43,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(
                                                        'https://magikindia.com/wp-content/uploads/2015/12/cherai-beach-kochi.jpg')),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 8,
                                                child: Text(
                                                  "${data.places?[i].name}",
                                                  maxLines: 3,
                                                  style:
                                                      GoogleFonts.jetBrainsMono(
                                                          color:
                                                              Color(0xFF2F2F2F),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 16),
                                                ),
                                              ),
                                              Spacer(),
                                              Text(
                                                "3.5 KM",
                                                style:
                                                    GoogleFonts.jetBrainsMono(
                                                        color:
                                                            Color(0xFF2F2F2F),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                      ],
                    ),
                  ),
                );
              },
              error: (error, stackTrace) => Center(
                  child:
                      Text("Not able load Right now Please try again later")),
              loading: () => Center(
                    child: CircularProgressIndicator(),
                  ))),
    );
  }
}
