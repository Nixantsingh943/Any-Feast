import 'package:flutter/material.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Offers'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,

      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              isDark ? 'lib/images/bg_dark.jpg' : 'lib/images/bg_light.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: offers.length,
            itemBuilder: (context, index) {
              return TweenAnimationBuilder(
                duration: const Duration(milliseconds: 600),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0, 30 * (1 - value)),
                    child: Opacity(opacity: value, child: child),
                  );
                },
                child: OfferCard(offer: offers[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}



class Offer {
  final String title;
  final String subtitle;
  final String image;

  Offer({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

final offers = [
  Offer(
    title: 'Flat 50% OFF',
    subtitle: 'On all indian items',
    image: 'lib/images/50off2.png',
  ),
  Offer(
    title: 'Buy 1 Get 1',
    subtitle: 'On AnyFeast',
    image: 'lib/images/b1g1.png',
  ),
  Offer(
    title: '20% Cashback',
    subtitle: 'On UPI Payments',
    image: 'lib/images/20cashback.png',
  ),
];



class OfferCard extends StatelessWidget {
  final Offer offer;

  const OfferCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.horizontal(left: Radius.circular(18)),
            child: Image.asset(
              offer.image,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    offer.title,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(offer.subtitle),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}