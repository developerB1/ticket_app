import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/bloc/text_expansion_blocs.dart';
import 'package:ticket_app/bloc/text_expansion_events.dart';
import 'package:ticket_app/bloc/text_expansion_states.dart';
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
                  child: ExpandedTextWidget(
                    text: hotelList[index]["details"],
                  ),
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
                    itemCount: hotelList[index]["images"].length,
                    itemBuilder: (context, imagesIndex) {
                      return Container(
                        margin: EdgeInsets.all(8),
                        child: Image.asset(
                            "assets/images/${hotelList[index]["images"][imagesIndex]}"),
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

class ExpandedTextWidget extends StatelessWidget {
  const ExpandedTextWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    // var provider = ref.watch(textExpansionNotifierProvider);
    return BlocBuilder<TextExpansionBloc, TextExpansionStates>(
        builder: (context, state) {
      if (state is IsExpandedState) {
        var isExpanded = state.isExpanded;
        var textWidget = Text(
          text,
          maxLines: isExpanded ? null : 9,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textWidget,
            GestureDetector(
              onTap: () {
                context
                    .read<TextExpansionBloc>()
                    .add(IsExpandedEvent(!isExpanded));
                // ref
                //     .watch(textExpansionNotifierProvider.notifier)
                //     .toggleText(provider);
              },
              child: Text(
                isExpanded ? 'Less' : 'More',
                style: AppStyles.textStyle.copyWith(
                  color: AppStyles.primaryColor,
                ),
              ),
            ),
          ],
        );
      } else {
        return Container();
      }
    });
  }
}
