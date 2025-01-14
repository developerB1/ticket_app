import 'package:flutter/material.dart';
import 'package:ticket_app/core/res/styles/app_styles.dart';
import 'package:ticket_app/core/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket_app/core/widgets/big_dot.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      height: 179,
      child: Container(
        margin: EdgeInsets.only(right: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: AppStyles.ticketBlue,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(21), topRight: Radius.circular(21))),
        child: Column(
          children: [
            //show departer and destination with icons first line
            Row(
              children: [
                Text(
                  "NYC",
                  style: AppStyles.headLineStyle3.copyWith(color: Colors.white),
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
                Text(
                  "LDN",
                  style: AppStyles.headLineStyle3.copyWith(color: Colors.white),
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
                  "New York",
                  style: AppStyles.headLineStyle3.copyWith(color: Colors.white),
                ),
                Expanded(child: Container()),
                Text(
                  "8 H 30M",
                  style: AppStyles.headLineStyle3.copyWith(color: Colors.white),
                ),
                Expanded(child: Container()),
                Text(
                  "London",
                  style: AppStyles.headLineStyle3.copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
