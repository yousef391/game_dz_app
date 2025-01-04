import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? expandedIndex;

  final List<Map<String, dynamic>> gamePosts = [
    {
      'title': 'Grand Theft Auto V',
      'image': 'assets/images/gtav.png',
      'consoles': ['xbox', 'play'],
      'type': 'sell',
      'price': '4500 DA',
      'details': 'Original copy, barely used'
    },
    {
      'title': 'Red Dead Redemption II',
      'image': 'assets/images/rdr2.jpg',
      'consoles': ['play'],
      'type': 'sell',
      'price': '3500 DA',
      'details': 'Perfect condition'
    },
    {
      'title': 'Forza Horizon 5',
      'image': 'assets/images/forza.jpg',
      'consoles': ['xbox', 'play'],
      'type': 'exchange',
      'exchangeFor': 'Gran Turismo 7',
      'details': 'Like new'
    },
    {
      'title': 'Assassin\'s Creed Origins',
      'image': 'assets/images/ac_origins.webp',
      'consoles': ['xbox', 'play'],
      'type': 'exchange',
      'exchangeFor': 'God of War Ragnarök',
      'details': 'Used once, like new'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1D2B),
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            _buildSearchBar(),
            SizedBox(height: 6),
            Expanded(
              child: _buildGamesList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'GameDZone!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFFF5B7F).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.notifications_none,
              color: Color(0xFFFF5B7F),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF2D2D3A),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.grey, size: 20),
                  hintText: 'Game search...',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: const Color(0xFF2D2D3A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGamesList() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10),
      itemCount: gamePosts.length,
      itemBuilder: (context, index) {
        final post = gamePosts[index];
        final bool isExpanded = expandedIndex == index;
        final bool isFirst = index == 0;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isExpanded ? 200 : 100,
          child: GestureDetector(
            onTap: () {
              setState(() {
                expandedIndex = isExpanded ? null : index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: isFirst ? const Radius.circular(20) : Radius.zero,
                ),
                image: DecorationImage(
                  image: AssetImage(post['image']),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: isFirst ? const Radius.circular(20) : Radius.zero,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.8),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            post['title'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            for (String console in post['consoles'])
                              Container(
                                margin: const EdgeInsets.only(left: 8),
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFF8A3D),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset(
                                  'assets/images/$console.png',
                                  height: 16,
                                  width: 16,
                                  color: Colors.white,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    if (isExpanded)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            post['type'] == 'sell'
                                ? post['price']
                                : 'Exchange for: ${post["exchangeFor"]}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF6C5DD3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'More details',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}