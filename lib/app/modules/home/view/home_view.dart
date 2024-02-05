// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_proj/app/core/theme/base_assets.dart';

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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: Image.asset(
            BaseAssets.logo,
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
                    for (int i = 0; i < 4; i++)
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.43,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    'https://magikindia.com/wp-content/uploads/2015/12/cherai-beach-kochi.jpg')),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
