// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_proj/app/core/theme/base_assets.dart';
import 'package:hackathon_proj/app/modules/home/providers/home_providers.dart';
import 'package:hackathon_proj/app/modules/home/view/home_view.dart';

class AskAiView extends ConsumerWidget {
  /// TODO add your comment here
  AskAiView({Key? key}) : super(key: key);

  static const routeName = '/askAi';

  List<String> placeOptions = [
    'hills stations',
    'beaches',
    'forests',
    'historical places',
    'mountains'
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
          title: Text(
            "GetSetGo",
            style: GoogleFonts.jetBrainsMono(color: Color(0xFF2f2f2f)),
          ),
          actions: [
            ImageIcon(
              AssetImage(BaseAssets.profile),
              color: Colors.black,
              size: 32,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            )
          ],
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
              TextFormField(
                  maxLines: 4,
                  decoration: new InputDecoration(
                    hintText:
                        'Eg:- 5000 budget, i prefer to spend time in mountains, snow fall is best',
                    hintStyle: GoogleFonts.jetBrainsMono(
                        fontSize: 14,
                        color: Color(0xFFB7B7B7),
                        fontWeight: FontWeight.w500),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        color: Color(0xFF2f2f2f),
                      ),
                    ),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              InkWell(
                onTap: () {
                  context.go(HomeView.routeName);
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
                            selectedColor: colorList[i],
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
              )
            ],
          ),
        )),
      ),
    );
  }
}
