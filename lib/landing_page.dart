import 'package:flutter/material.dart';
import 'constants.dart';
//import 'dashboard.dart';
import 'size_config.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  //final String title;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: null,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    //double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'Way To Manage Your Finances Easily',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 75),
          Container(
            width: double.infinity,
            //alignment: Alignment.center,

            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/dashboard',
                );
              },
              child: Container(
                height: screenHeight * 0.08,
                //width: screenWidth * 0.75,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [kGradientColor2, kGradientColor1],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(fontSize: 20, color: kButtonTextColor),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
