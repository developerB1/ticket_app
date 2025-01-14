import 'package:flutter/material.dart';
import 'package:ticket_app/core/res/styles/app_styles.dart';
import 'package:ticket_app/core/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket_app/core/widgets/big_circle.dart';
import 'package:ticket_app/core/widgets/big_dot.dart';
import 'package:ticket_app/core/widgets/text_style_fourth.dart';
import 'package:ticket_app/core/widgets/text_style_third.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      height: 189,
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Column(
          children: [
            //blue part of the ticket
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppStyles.ticketBlue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(21),
                      topRight: Radius.circular(21))),
              child: Column(
                children: [
                  //show departer and destination with icons first line
                  Row(
                    children: [
                      TextStyleThird(
                        text: "NYC",
                      ),
                      Expanded(child: Container()),
                      BigDot(),
                      Expanded(
                          child: Stack(
                        children: [
                          SizedBox(
                            height: 24,
                            child: AppLayoutBuilderWidget(
                              randomDivider: 6,
                            ),
                          ),
                          Center(
                            child: Transform.rotate(
                              angle: 1.58,
                              child: Icon(
                                Icons.local_airport_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )),
                      BigDot(),
                      Expanded(child: Container()),
                      TextStyleThird(
                        text: "LDN",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  //show departer and destination names with time
                  Row(
                    children: [
                      SizedBox(
                          width: 100, child: TextStyleFourth(text: "New York")),
                      Expanded(child: Container()),
                      TextStyleFourth(text: "8H 30M"),
                      Expanded(child: Container()),
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(
                          text: "London",
                          align: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //circles and dots
            Container(
              height: 20,
              color: AppStyles.ticketOrange,
              child: Row(
                children: [
                  BigCircle(isRight: false),
                  Expanded(
                      child: AppLayoutBuilderWidget(
                    randomDivider: 16,
                    width: 6,
                  )),
                  BigCircle(isRight: true)
                ],
              ),
            ),
            //orange part of the ticket
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppStyles.ticketOrange,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21))),
              child: Column(
                children: [
                  //show departer and destination with icons first line
                  Row(
                    children: [
                      Text(
                        "1 MAY",
                        style: AppStyles.headLineStyle3
                            .copyWith(color: Colors.white),
                      ),
                      Expanded(child: Container()),
                      Text(
                        "08:00 AM",
                        style: AppStyles.headLineStyle3
                            .copyWith(color: Colors.white),
                      ),
                      Expanded(child: Container()),
                      Text(
                        "25",
                        style: AppStyles.headLineStyle3
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  //show departer and destination names with time
                  Row(
                    children: [
                      Text(
                        "Date",
                        style: AppStyles.headLineStyle4
                            .copyWith(color: Colors.white),
                      ),
                      Expanded(child: Container()),
                      Text(
                        "Departure time",
                        style: AppStyles.headLineStyle4
                            .copyWith(color: Colors.white),
                      ),
                      Expanded(child: Container()),
                      Text(
                        "Number",
                        style: AppStyles.headLineStyle4
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
