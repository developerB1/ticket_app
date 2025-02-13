import 'package:flutter/material.dart';
import 'package:ticket_app/core/utils/app_routes.dart';
import 'package:ticket_app/screens/home/all_tickets.dart';
import 'package:ticket_app/screens/ticket/ticket_screen.dart';

import 'core/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => BottomNavBar(),
        "/all_tickets": (context) => AllTickets(),
        AppRoutes.ticketView: (context) => TicketScreen(),
      },
    );
  }
}
