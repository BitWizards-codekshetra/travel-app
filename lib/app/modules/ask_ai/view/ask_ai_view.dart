// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_proj/app/core/theme/base_assets.dart';
import 'package:hackathon_proj/app/modules/ask_ai/repository/ask_ai_repository.dart';
import 'package:hackathon_proj/app/modules/bottom_bar/view/bottom_bar_view.dart';
import 'package:hackathon_proj/app/modules/home/providers/home_providers.dart';

class AskAiView extends ConsumerWidget {
  AskAiView({Key? key}) : super(key: key);

  static const routeName = '/askAi';

  List<String> placeOptions = [
    'hills stations',
    'beaches',
    'forests',
    'historical places',
    'mountains'
  ];

  List<String> transportOptions = [
    'Train',
    'Bus',
    'Cars',
  ];

  List<String> priceOptions = [
    '0-4999',
    '5000-9999',
    '10000-14999',
    '15000-19999',
    '20000+'
  ];

  List<Color> colorList = [
    Color(0XffFF8383),
    Color(0xFFF1F604),
    Color(0xFFF1F604),
    Color(0xFF05FF00),
    Color(0xFF62FFD9),
    Color(0xFFCDCDCB)
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final choiceSelected = ref.watch(selectedChoiceProvider);
    final priceChoice = ref.watch(selectedPriceChoiceProvider);
    final travelChoice = ref.watch(selectedTransportChoiceProvider);

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
              vertical: MediaQuery.of(context).size.height * 0.02,
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What kind of trip do you prefer?",
                style: GoogleFonts.jetBrainsMono(
                    fontSize: 14,
                    color: Color(0xFF2f2f2f),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Center(
                child: Text(
                  "Add Tags",
                  style: GoogleFonts.jetBrainsMono(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color(0xFF2F2F2F)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: MediaQuery.of(context).size.width * 0.12,
                    children: [
                      for (int i = 0; i < placeOptions.length; i++)
                        ChoiceChip(
                            backgroundColor: colorList[i],
                            selectedColor: colorList[i].withOpacity(0.3),
                            onSelected: (value) async {
                              ref
                                  .read(selectedChoiceProvider.notifier)
                                  .selectCategories(
                                    placeOptions[i],
                                  );
                            },
                            label: Text(
                              placeOptions[i],
                              style: GoogleFonts.jetBrainsMono(
                                  color: choiceSelected == placeOptions[i]
                                      ? Colors.black
                                      : Colors.black),
                            ),
                            selected: choiceSelected == placeOptions[i]),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Center(
                child: Text(
                  "Prefered Price",
                  style: GoogleFonts.jetBrainsMono(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color(0xFF2F2F2F)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: MediaQuery.of(context).size.width * 0.12,
                    children: [
                      for (int i = 0; i < priceOptions.length; i++)
                        ChoiceChip(
                            backgroundColor: colorList[i],
                            selectedColor: colorList[i].withOpacity(0.3),
                            onSelected: (value) async {
                              ref
                                  .read(selectedPriceChoiceProvider.notifier)
                                  .selectCategories(
                                    priceOptions[i],
                                  );

                              log(ref.read(selectedPriceChoiceProvider));
                            },
                            label: Text(
                              priceOptions[i],
                              style: GoogleFonts.jetBrainsMono(
                                  color: priceChoice == priceOptions[i]
                                      ? Colors.black
                                      : Colors.black),
                            ),
                            selected: priceChoice == priceOptions[i]),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Center(
                child: Text(
                  "Transport Option",
                  style: GoogleFonts.jetBrainsMono(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color(0xFF2F2F2F)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: MediaQuery.of(context).size.width * 0.12,
                    children: [
                      for (int i = 0; i < transportOptions.length; i++)
                        ChoiceChip(
                            backgroundColor: colorList[i],
                            selectedColor: colorList[i].withOpacity(0.3),
                            onSelected: (value) async {
                              ref
                                  .read(
                                      selectedTransportChoiceProvider.notifier)
                                  .selectCategories(
                                    transportOptions[i],
                                  );
                            },
                            label: Text(
                              transportOptions[i],
                              style: GoogleFonts.jetBrainsMono(
                                  color: travelChoice == transportOptions[i]
                                      ? Colors.black
                                      : Colors.black),
                            ),
                            selected: travelChoice == transportOptions[i]),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              InkWell(
                onTap: () {
                  context.push(BottomBarView.routeName);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Color(0xFFFCBF49)),
                  child: Center(
                    child: Text(
                      "Ask AI",
                      style:
                          GoogleFonts.jetBrainsMono(color: Color(0xFF2f2f2f)),
                    ),
                  ),
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
}
