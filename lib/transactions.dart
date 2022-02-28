import 'package:bank_project/constants.dart';
import 'package:bank_project/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;
import 'data.dart';
import 'models/transaction.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  get type => null;

  @override
  Widget build(BuildContext context) {
    var items = transactions;

    //print(outputDate);
    return ListView.builder(
      padding: const EdgeInsets.only(top: 0),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        var currentItem = items[index];
        var outputFormat = DateFormat('dd MMM yy');
        var outputDate = outputFormat.format(currentItem.date);

        return Container(
          child: ListTile(
            onTap: () => _showTransactionDetails(
              currentItem.icon,
              currentItem.company,
              currentItem.amount,
              currentItem.paymentMode,
              currentItem.date,
            ),
            //dense: true,
            // contentPadding: EdgeInsets.only(
            //   //left: 0.0,
            //   right: getProportionateScreenWidth(10),
            // ),
            //minLeadingWidth: 0,
            //horizontalTitleGap: 0,
            //visualDensity: const VisualDensity(horizontal: 0, vertical: 0),
            leading: (currentItem.icon != null && currentItem.icon != '')
                ? Container(child: buildIcon(currentItem.icon))
                : null,
            title: Text(
              currentItem.company,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              outputDate.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            trailing: Text(
              items[index].amount.toString(),
              style: TextStyle(
                  color: (currentItem.type == "Cr")
                      ? kGradientColor1
                      : kGradientColor2,
                  fontSize: 18),
            ),
          ),
        );
        //);
      },
    );
  }

  Widget buildIcon(iconUrl) {
    return Container(
      // height: getProportionateScreenHeight(50),
      // width: getProportionateScreenWidth(50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[900],
      ),
      //color: Colors.grey[900],
      child: IconButton(
          //color: Colors.white,
          //padding: EdgeInsets.all(20),
          //iconSize: 50,
          icon: SvgPicture.asset(
            iconUrl,
            color: Colors.white,
          ),
          onPressed: () {
            // do something
          }),
    );
  }

  void _showTransactionDetails(
      iconUrl, company, amount, paymentMode, dateTime) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    var outputFormat = DateFormat('dd MMM yy, hh:mm');
    var transactionDateTime = outputFormat.format(dateTime);
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent.withOpacity(1),
      builder: (context) => Wrap(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: getProportionateScreenHeight(_screenHeight * 0.45),
              width: getProportionateScreenWidth(_screenWidth),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [kGradientColor1, kGradientColor2],
                  begin: Alignment(0.0, -2.0),
                  end: Alignment(1.0, 2.0),
                  stops: [0.35, 0.7],
                  transform: GradientRotation(math.pi / 3.5),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: buildIcon(iconUrl),
                          height: getProportionateScreenHeight(75),
                          width: getProportionateScreenWidth(75),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        company,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        paymentMode,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        kRupeeSymbol + amount.toString(),
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        transactionDateTime.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: getProportionateScreenHeight(80),
                        //width: getProportionateScreenWidth(300),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.star_border,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Favourite',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.repeat,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Repeat',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            const SizedBox(height: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.share,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Share',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
