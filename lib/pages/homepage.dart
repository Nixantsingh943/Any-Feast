import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/top_navbar.dart';
import 'cart.dart';
import 'recipes.dart';
import 'offer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final pages = const [HomeContent(), RecipesPage(), CartPage(), OfferPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNav(
        currentIndex: index,
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  bool animate = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() => animate = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const TopNavbar(), 
      extendBodyBehindAppBar: true, 
      body: AnimatedContainer(
        duration: const Duration(seconds: 2),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              isDark ? 'lib/images/bg_dark.jpg' : 'lib/images/bg_light.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //search bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search recipes, meals, plans...",
                        prefixIcon: const Icon(Icons.search),
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: isDark ? Colors.grey[800] : Colors.grey[200],
                        filled: true,
                      ),
                    ),
                  ),
                ),
                // LOGO
                AnimatedScale(
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.easeOutBack,
                  scale: animate ? 1 : 0.6,
                  child: Image.asset('lib/images/logo.png', height: 120),
                ),

                const SizedBox(height: 20),

                // APP NAME
                AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: animate ? 1 : 0,
                  child: Text(
                    'AnyFeast',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // TAGLINE
                AnimatedOpacity(
                  duration: const Duration(seconds: 2),
                  opacity: animate ? 1 : 0,
                  child: Text(
                    'Plan • Cook • Enjoy',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 40),

                // CTA BUTTON
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 45,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Get Started',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                // featured items section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: featuredSection(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // featured section widgets
  Widget featuredSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Featured Items',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              FeaturedCard(
                image: 'lib/images/moongdal.jpg',
                title: 'Moong Daal Halwa',
              ),
              FeaturedCard(
                image: 'lib/images/keemarice.jpg',
                title: 'Keema Rice',
              ),
              FeaturedCard(
                image: 'lib/images/chikenbhaat.jpg',
                title: 'Chiken Bhat',
              ),
              FeaturedCard(
                image: 'lib/images/chikenbhaat.jpg',
                title: 'Chiken Bhat',
              ),
              
            ],
          ),
        ),
      ],
    );
  }
}

// featured card

class FeaturedCard extends StatelessWidget {
  final String image;
  final String title;

  const FeaturedCard({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        color: isDark ? Colors.black54 : Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 8,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(18),
            ),
            child: Image.asset(
              image,
              height: 110,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
