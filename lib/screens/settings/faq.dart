import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Faq extends StatelessWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('About Our Service'),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),

            ExpansionTile(
                "WHAT DO YOU BUILD",
                """In short, everything! However, easy to live with, solid wood tables are what we are known for. But as you can see from the site, there is not much that’s outside our comfort zone or skill level. We also do a lot with metal, mostly bases, but we build all metal tables as well.""",
                false),
            SizedBox(
              height: 20,
            ),
            ExpansionTile(
                "DO YOU CHARGE FOR DELIVERY ?",
                """Yes, we do charge for delivery. Typically starting at ₹250 – ₹300 for a white glove service. Price is subject to vary depending on details. This means a completely hands-off process for you. We deliver one day a week, on Saturdays usually from an 8am – 5pm window. All furniture will be brought into the spot you request. Felt pads are installed upon setup. Our tables are not light so we encourage customers to go with the delivery option.""",
                false),
            SizedBox(
              height: 20,
            ),
            // ExpansionTile("How to top up balance on Wecare?","""Wecare is greatest Donation, Charity & Fundraising Mobile App platform in this century.""", false),
            //  Styles.KHeight20,
            ExpansionTile(
                "WHEN CAN WE EXPECT DELIVERY?",
                """Our lead time is 18 weeks out. If we can get your order to you earlier than the 18 weeks, we will try our best, but we ask our customers to factor for 18 weeks. Currently we deliver only on Saturdays using an 8am – 5pm window. The week of your scheduled delivery you will receive a confirmation email of completion. This email will also include details regarding delivery time, balance due, an order, and care form. We don’t typically have much wiggle room in our routes, so if the specified Saturday does not work for you, we’ll reschedule for the following Saturday.""",
                false),
            SizedBox(
              height: 20,
            ),
            ExpansionTile(
                "WHAT KIND OF WOOD DO YOU USE TO BUILD YOUR TABLE?",
                """We typically use hickory or ash for our tables. They are some of the hardest domestic wood species available. They also bring a level of character to the table and have a gorgeous look. We also have experience using walnut for our tables. Walnut is a slightly softer wood, but is still absolutely beautiful in its natural unstained state. That being said, please don’t ask us to stain walnut! Certain pieces of furniture may call for a specific type of wood, so we will work with any wood species. Over the years, we’ve built custom wood furniture using oak, cherry, maple, and even exotic woods. Just tell us the type of wood you’d like to use and we can bring your vision to life! Or, if you have no idea what kind of wood you’d like to use, we can offer our expertise and choose the best option for the piece of furniture you have in mind.""",
                false),
            SizedBox(
              height: 20,
            ),
            ExpansionTile(
                "DO YOU WARRANTY YOUR PIECES?",
                """ Yes! We stand by the quality of our work and warranty each of our pieces of custom furniture for 227 years! Our warranty covers structural issues only. Wear and tear is not covered, so be sure to take special care of your table. Humidity and/or moisture issues aren’t covered either. We build our furniture using large solid wood planks. Because we are using solid wood, it is more susceptible to moisture and temperature changes. This means the table tops will move slightly and very minor cracks could develop. We use techniques to keep this to a minimum and give the table room to adjust. However, the wood can expand and contract depending on the temperature. So, it’s important to keep your custom wood table in a stable environment. Drastic changes in temperature and humidity levels could cause damage that isn’t covered under our warranty.""",
                true),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

ExpansionTileCard ExpansionTile(title, subTitle, isExpand) {
  return ExpansionTileCard(
    // key: cardA,
    elevation: 1,
    animateTrailing: true,
    initiallyExpanded: isExpand,

    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
    baseColor: Colors.white,
    expandedTextColor: Color.fromARGB(252, 0, 0, 0),
    expandedColor: Color.fromARGB(255, 255, 255, 255),
    shadowColor: Colors.lightGreenAccent,
    // colorCurve: Curves.easeInSine,
    trailing: Icon(Icons.arrow_drop_down, color: Colors.black),
    title: Text(
      title,
      style: GoogleFonts.acme(fontSize: 18),
    ),
    // subtitle: Text('I expand, too!'),
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 20),
        child: Divider(
          color: Colors.grey[800],
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 18.0,
          ),
          child: Text(
            subTitle,
            style: GoogleFonts.acme(),
          ),
        ),
      ),
    ],
  );
}
