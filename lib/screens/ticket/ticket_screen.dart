import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/core/res/media.dart';
import 'package:ticket_app/core/res/styles/app_styles.dart';
import 'package:ticket_app/core/utils/app_json.dart';
import 'package:ticket_app/core/widgets/app_column_text_layout.dart';
import 'package:ticket_app/core/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket_app/core/widgets/ticket_view.dart';
import 'package:ticket_app/screens/search/widgets/app_ticket_tabs.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            "Tickets",
            style: AppStyles.headLineStyle1,
          ),
          SizedBox(
            height: 20,
          ),
          AppTicketTabs(
            firstTab: "Upcoming",
            secondTab: "Previous",
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 16),
            child: TicketView(
              ticket: ticketList[0],
              isColor: true,
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            color: AppStyles.ticketColor,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnTextLayout(
                      alignment: CrossAxisAlignment.start,
                      topText: "Flutter DB",
                      bottomText: "Passenger",
                      isColor: true,
                    ),
                    AppColumnTextLayout(
                      alignment: CrossAxisAlignment.end,
                      topText: "5144 65263",
                      bottomText: "Passport",
                      isColor: true,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                AppLayoutBuilderWidget(
                  randomDivider: 15,
                  width: 5,
                  isColor: false,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnTextLayout(
                      alignment: CrossAxisAlignment.start,
                      topText: "2144 23221987778",
                      bottomText: "Number of E-Ticket",
                      isColor: true,
                    ),
                    AppColumnTextLayout(
                      alignment: CrossAxisAlignment.end,
                      topText: "B535325",
                      bottomText: "Booking Code",
                      isColor: true,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                AppLayoutBuilderWidget(
                  randomDivider: 15,
                  width: 5,
                  isColor: false,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AppMedia.visaCard,
                              scale: 11,
                            ),
                            Text(
                              "*** 2465",
                              style: AppStyles.headLineStyle3,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Payment Method",
                          style: AppStyles.headLineStyle4,
                        )
                      ],
                    ),
                    AppColumnTextLayout(
                      alignment: CrossAxisAlignment.end,
                      topText: "\$299.99",
                      bottomText: "Price",
                      isColor: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1,
          ),
          // bottom of the ticket detail section
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: AppStyles.ticketColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(21),
                bottomRight: Radius.circular(21),
              ),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Center(
                  child: BarcodeWidget(
                    height: 70,
                    barcode: Barcode.code128(),
                    data: 'https://www.google.com',
                    drawText: false,
                    color: AppStyles.textColor,
                    width: double.infinity,
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
