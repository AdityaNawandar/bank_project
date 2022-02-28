import 'package:bank_project/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'constants.dart';
import 'size_config.dart';
import 'transactions.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  //var routeName = '/dashboard';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: null,
      body: buildBody(),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Widget buildBody() {
    SizeConfig().init(context);
    //var orientation = MediaQuery.of(context).orientation;
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    String assetName = 'assets/images/visa.svg';
    final Widget svgIcon = SvgPicture.asset(
      assetName,
      color: Colors.black,
      semanticsLabel: 'Visa Logo',
    );

    return Container(
      height: _screenHeight,
      width: double.infinity,
      //alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
          top: _screenHeight * 0.1,
          //right: _screenWidth * 0.04,
          //left: 0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // GestureDetector(
            //   onTap: () {},
            //   child:

            ///CARD
            Container(
              height: getProportionateScreenHeight(220),
              width: getProportionateScreenWidth(_screenWidth * 0.88),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [kGradientColor1, kGradientColor2],
                  begin: Alignment(-1.0, -2.0),
                  end: Alignment(1.0, 2.0),
                  stops: [0.35, 0.7],
                  transform: GradientRotation(math.pi / 8),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  right: 15,
                  left: 15,
                ),
                //child: Expanded(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Current Balance',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '$kRupeeSymbol\36,795.80',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '**** **** **** 0924',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight, child: svgIcon,
                        //),
                      ),
                    ),
                  ],
                ),
                //),
              ),
            ),

            //),
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),

            Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(15),
                bottom: getProportionateScreenWidth(10),
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Transactions',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),

            Transactions(),
          ],
        ),
      ),
    );
  }

  TextButton buildButton(
      onPress, buttonText, border, textColor, backgroundColor) {
    return
        // SizedBox(
        //   height: getProportionateScreenHeight(30),
        //   width: getProportionateScreenWidth(200),
        //child:
        TextButton(
      onPressed: onPress as void Function()?,
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 15,
        ),
        primary: textColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: border,
        ),
      ),
      child: Text(
        buttonText,
      ),
    );
    // );
  }

  //METHOD TO SET STATE - BottomNavBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Container _buildSelectedIcon(IconData icon) {
    return Container(
      height: getProportionateScreenHeight(75),
      width: getProportionateScreenWidth(75),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [kGradientColor1, kGradientColor2],
          begin: Alignment(-1.0, -2.0),
          end: Alignment(1.0, 2.0),
          stops: [0.3, 0.7],
          transform: GradientRotation(math.pi / 4),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(icon),
      //color: Colors.red,
    );
  }

  BottomNavigationBar getBottomNavigationBar() {
    return
        // Padding(
        //   padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20),
        //   child: ClipPath(
        //     clipper: const ShapeBorderClipper(
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.all(Radius.circular(20)),
        //       ),
        //     ),
        //     child:
        BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTapped,
      backgroundColor: kBottomNavBarBackgroundColor.withOpacity(1),
      selectedItemColor: kBottomNavBarSelectedItemColor,
      unselectedItemColor: kBottomNavBarUnselectedItemColor,
      currentIndex: _selectedIndex,
      selectedLabelStyle: const TextStyle(
        fontSize: kBottomNavBarItemFontSize,
      ),
      iconSize: 30.0,
      items: [
        BottomNavigationBarItem(
          label: '',
          icon: const Icon(
            Icons.home_outlined,
            color: kBottomNavBarIconsColor,
          ),
          activeIcon: _buildSelectedIcon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: const Icon(
            Icons.person_outline,
            color: kBottomNavBarIconsColor,
          ),
          activeIcon: _buildSelectedIcon(Icons.person),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: const Icon(
            Icons.qr_code_scanner_outlined,
            color: kBottomNavBarIconsColor,
          ),
          activeIcon: _buildSelectedIcon(Icons.qr_code_scanner_rounded),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: const Icon(
            Icons.insert_chart_outlined,
            color: kBottomNavBarIconsColor,
          ),
          activeIcon: _buildSelectedIcon(Icons.insert_chart),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: const Icon(
            Icons.account_balance_wallet_outlined,
            color: kBottomNavBarIconsColor,
          ),
          activeIcon: _buildSelectedIcon(Icons.account_balance_wallet),
        )
      ],
      // ),
      //),
    );
  }
}
