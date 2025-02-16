import 'package:flutter/material.dart';
import 'package:ticket_app/core/res/styles/app_styles.dart';
import 'package:ticket_app/core/utils/app_json.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late int index = 0;
  @override
  void didChangeDependencies() {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    index = args["index"];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppStyles.primaryColor,
                  ),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              // title: Text(hotelList[index]["place"],
              //     style: TextStyle(color: Colors.white)),
              background: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                        "assets/images/${hotelList[index]["image"]}",
                        fit: BoxFit.cover),
                  ),
                  Positioned(
                    bottom: 20.0,
                    right: 20.0,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        hotelList[index]["place"],
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: AppStyles.primaryColor,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                      "Where Comfort Meets Elegance \n\nWelcome to Muster Hotel, your perfect retreat in [Location]. Whether you're visiting for business or leisure, our modern design, exceptional service, and prime location ensure a seamless and unforgettable stay. Stylish Accommodations \n\nRelax in our beautifully appointed rooms and suites, featuring [plush bedding, high-speed Wi-Fi, smart TVs, minibars, private balconies, etc.]. Each space is designed for comfort and convenience, offering a tranquil escape from the hustle and bustle.\n\nDining & Drinks \n\nSavor the flavors of [cuisine type] at [Hotel Restaurant Name], where our chefs craft delicious dishes using the finest local ingredients. Unwind with a signature cocktail at [Bar/Lounge Name], or grab a quick bite at [Café Name]. \n\nSignature Amenities \n\nInfinity Pool & Spa – Rejuvenate with a relaxing dip or a soothing spa treatment. \n\nFitness Center – Stay active with top-of-the-line gym facilities. \n\nBusiness & Event Spaces – Host meetings, conferences, or special occasions in our versatile venues. \n\nConcierge Services – From city tours to restaurant reservations, we take care of the details. \n\nDiscover [City/Region] \n\nIdeally located [mention proximity to landmarks, business districts, shopping centers, beaches, mountains, etc.], Muster Hotel places you at the heart of it all. Whether you're here for adventure, relaxation, or business, there's something for everyone. \n\nBook your stay today and experience the best of hospitality at Muster Hotel. \n\n"),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "More images",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 200.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8),
                        child: Image.network("https://picsum.photos/200/200"),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
