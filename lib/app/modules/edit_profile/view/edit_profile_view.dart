import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_proj/app/core/theme/app_theme.dart';

class EditProfileView extends ConsumerWidget {
  const EditProfileView({Key? key}) : super(key: key);

  static const routeName = '/editProfile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit Profile"),
          centerTitle: true,
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        backgroundColor: appTheme.lightTheme.primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.01,
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: appTheme.darkTheme.primaryColor,
                  radius: MediaQuery.of(context).size.width * 0.12,
                  child: Image.network(
                      'https://imgs.search.brave.com/B1ZhL7CyFQbqRRXYtHKMXvtu0B9RRJWFhkT7Ugdm7tE/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9jZG4t/aWNvbnMtcG5nLmZs/YXRpY29uLmNvbS8x/MjgvMTE0NzIvMTE0/NzI3ODMucG5n'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.blueGrey, blurRadius: 3)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Center(
                      child: Row(
                    children: [
                      Text(
                        "First Name",
                        style: TextStyle(
                            color: Color(0xFF2f2f2f),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      Spacer(),
                      Icon(
                        Icons.edit,
                        color: Colors.black,
                      )
                    ],
                  )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.blueGrey, blurRadius: 3)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Center(
                      child: Row(
                    children: [
                      Text(
                        "Last Name",
                        style: TextStyle(
                            color: Color(0xFF2f2f2f),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      Spacer(),
                      Icon(
                        Icons.edit,
                        color: Colors.black,
                      )
                    ],
                  )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.blueGrey, blurRadius: 3)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Center(
                      child: Row(
                    children: [
                      Text(
                        "Address",
                        style: TextStyle(
                            color: Color(0xFF2f2f2f),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      Spacer(),
                      Icon(
                        Icons.edit,
                        color: Colors.black,
                      )
                    ],
                  )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.blueGrey, blurRadius: 3)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Center(
                      child: Row(
                    children: [
                      Text(
                        "Mobile Number",
                        style: TextStyle(
                            color: Color(0xFF2f2f2f),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      Spacer(),
                      Icon(
                        Icons.edit,
                        color: Colors.black,
                      )
                    ],
                  )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.075,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
