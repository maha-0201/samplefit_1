import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class AppColors {
  static const Color background = Color(0xFFF7F2EB);
  static const Color darkGreen = Color(0xFF1E352F);
  static const Color lightGreen = Color(0xFFE2EFE0);
  static const Color accentOrange = Color(0xFFE89A3E);
  static const Color cardWhite = Colors.white;
  static const Color textDark = Color(0xFF1C1C1C);
  static const Color textMuted = Color(0xFF7A7A7A);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  final List<Widget> screens = [
    const HomeScreen(), // Home Page
    const SearchScreen(), // Search Page
    const ProfileScreen(), // Profile Page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(45),
          clipBehavior: Clip
              .antiAlias, // Ensures child screens respect the rounded corners
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            image: const DecorationImage(
              image: AssetImage('assets/fitimage.1.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              // 1. Welcome and Stats (Only visible on Home Tab to prevent background bleed)
              if (selectedIndex == 0)
                const Padding(
                  padding: EdgeInsets.all(26),
                  child: Column(children: [
                    firststep(),
                    SizedBox(height: 280),
                    secondstep(),
                  ]),
                ),

              // 2. Active Screen Content
              Positioned.fill(child: screens[selectedIndex]),

              // 3. Navigation Bar
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.home,
                            color: selectedIndex == 0
                                ? Colors.green
                                : Colors.white),
                        onPressed: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                      ),
                      IconButton(
                          icon: Icon(Icons.search,
                              color: selectedIndex == 1
                                  ? Colors.green
                                  : Colors.white),
                          onPressed: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          }),
                      IconButton(
                        icon: Icon(Icons.person,
                            color: selectedIndex == 2
                                ? Colors.green
                                : Colors.white),
                        onPressed: () {
                          setState(() {
                            selectedIndex = 2;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // 4. Outer Phone Border Overlay
              // Drawing this here ensures the screen frame border stays visible on top of all pages.
              Positioned.fill(
                child: IgnorePointer(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: const Color.fromARGB(255, 250, 219, 208),
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class firststep extends StatefulWidget {
  const firststep({super.key});

  @override
  State<firststep> createState() => _firststepState();
}

class _firststepState extends State<firststep> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150'),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 15,
                  width: 15,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: const Icon(Icons.keyboard_arrow_up,
                      size: 10, color: AppColors.darkGreen),
                ),
                const SizedBox(width: 4),
                const Text(
                  '124kkal',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.darkGreen),
                ),
                const SizedBox(width: 120),
                Container(
                  height: 34,
                  width: 34,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(14)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.menu, size: 12, color: AppColors.lightGreen),
                      Icon(Icons.flash_on_rounded,
                          size: 14, color: AppColors.darkGreen),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Welcome Section
        const Text(
          'Hey, Michelle',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Welcome, 11-week.\nKeep keep going!',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.textDark,
                height: 1.5,
              ),
            ),
            const SizedBox(width: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Text(
                    "🔥",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '11',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: AppColors.textDark),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

class secondstep extends StatefulWidget {
  const secondstep({super.key});

  @override
  State<secondstep> createState() => _secondstepState();
}

class _secondstepState extends State<secondstep> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 345,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 240, 213, 178),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.menu, size: 12, color: Colors.blue),
              Icon(Icons.flash_on_rounded, size: 12, color: Colors.blue),
              SizedBox(width: 10),
              Text(
                "Active Stats",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(width: 180),
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.grey,
                child: Icon(Icons.plus_one, color: Colors.black, size: 10),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem('450', 'kcal', 'Duration'),
              Container(
                width: 1,
                height: 30,
                color: AppColors.textMuted.withOpacity(0.3),
              ),
              _buildStatItem('72', 'min', 'Workouts'),
            ],
          )
        ],
      ),
    );
  }
}

Widget _buildStatItem(String mainText, String sText, String subText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Text(
            mainText,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark),
          ),
          Text(
            sText,
            style: const TextStyle(fontSize: 10, color: AppColors.textDark),
          ),
        ],
      ),
      const SizedBox(height: 2),
      Text(
        subText,
        style: const TextStyle(fontSize: 12, color: AppColors.textDark),
      ),
    ],
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(''),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const searchstep(),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'Activity Summary',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textDark),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const CircleAvatar(
                                backgroundColor: Colors.white12,
                                child: Icon(Icons.directions_walk,
                                    color: Colors.lightBlueAccent),
                              ),
                              title: const Text('Walking steps',
                                  style: TextStyle(color: Colors.black)),
                              trailing: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    height: 20,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.black12.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Text('Week',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 9)),
                                  )),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  _buildBar("Sun", "8,328", 70,
                                      const Color(0xFF2D503D)),
                                  const SizedBox(width: 20),
                                  _buildBar("Mon", "10,032", 85,
                                      const Color(0xFF2D503D)),
                                  const SizedBox(width: 20),
                                  _buildBar("Tue", "8,211", 65,
                                      const Color(0xFF2D503D)),
                                  const SizedBox(width: 20),
                                  // Wednesday is highlighted
                                  _buildHighlightedBar("Wed", "7,427", 60,
                                      const Color(0xFFF4A261)),
                                  const SizedBox(width: 20),
                                  _buildEmptyBar("Thr"),
                                  const SizedBox(width: 20),
                                  _buildEmptyBar("Fri"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 175,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ListTile(
                                    leading: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.blueGrey,
                                      child: Icon(Icons.share),
                                    ),
                                    title: Text(
                                      'Sets',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    )),
                                const SizedBox(height: 10),
                                const Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                          text: '7,3',
                                          style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          )),
                                      TextSpan(
                                          text: 'k',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          )),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                const Text('Duration',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15)),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(2),
                                      height: 20,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.purpleAccent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Text('Run',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10)),
                                    ),
                                    const SizedBox(width: 5),
                                    Container(
                                      padding: const EdgeInsets.all(3),
                                      height: 20,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Text('Gym',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10)),
                                    ),
                                    const SizedBox(width: 5),
                                    Container(
                                      padding: const EdgeInsets.all(3),
                                      height: 20,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.orangeAccent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Text('Walk',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10)),
                                    ),
                                    const SizedBox(width: 5),
                                    const CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.black,
                                        child: Icon(Icons.add,
                                            color: Colors.white, size: 15))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: 178,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ListTile(
                                    leading: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.blueGrey,
                                      child: Icon(Icons.watch),
                                    ),
                                    title: Text(
                                      'Heart rate',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    )),
                                const SizedBox(height: 6),
                                const Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                          text: '139',
                                          style: TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          )),
                                      TextSpan(
                                          text: 'bpm',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          )),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 3),
                                const Text('Duration',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15)),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  height: 20,
                                  width: 175,
                                  decoration: BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white60,
                                        radius: 6,
                                        child: Icon(Icons.refresh, size: 9),
                                      ),
                                      SizedBox(width: 5),
                                      Text('Device:Apple Wat...',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            const ListTile(
                              leading: Icon(Icons.emoji_events_outlined,
                                  size: 25, color: Colors.blue),
                              title: Text(
                                'Todays Goals',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.black,
                                ),
                              ),
                              trailing: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.black,
                                  child: Icon(Icons.add,
                                      color: Colors.white, size: 10)),
                            ),
                            thirdtask(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class searchstep extends StatelessWidget {
  const searchstep({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150'),
        ),
        const SizedBox(width: 12),
        Container(
          height: 15,
          width: 15,
          decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: const Icon(Icons.keyboard_arrow_up,
              size: 10, color: AppColors.darkGreen),
        ),
        const SizedBox(width: 4),
        const Text(
          '124kkal',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.darkGreen),
        ),
        const Spacer(),
        Container(
          height: 34,
          width: 34,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(14)),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.menu, size: 12, color: AppColors.lightGreen),
              Icon(Icons.flash_on_rounded,
                  size: 14, color: AppColors.darkGreen),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _buildBar(String day, String steps, double iheight, Color color) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(6),
        width: 35,
        height: iheight,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: const Border(
            top: BorderSide(
              color: Colors.black,
              width: 3,
            ),
          ),
        ),
        child: Text(
          steps,
          style: const TextStyle(
              fontSize: 8, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        day,
        style: const TextStyle(fontSize: 12, color: Colors.black),
      ),
    ],
  );
}

// Highlighted Wednesday Bar with Tooltip bubble
Widget _buildHighlightedBar(
    String day, String steps, double iheight, Color color) {
  return Column(
    children: [
      // The Black Tooltip Bubble
      Container(
        height: 15,
        width: 30,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: const Color(0xFF1D1D1D),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          steps,
          style: const TextStyle(
              color: Colors.white, fontSize: 6, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(height: 0.5),

      // Small connector "dot/tip" (simplified)

      const Icon(Icons.arrow_drop_down, size: 12, color: Colors.black),
      const SizedBox(height: 5),

      Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 30,
            height: iheight,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
              border: const Border(
                  top: BorderSide(
                color: Colors.black,
                width: 3,
              )),
            ),
          ),
          Positioned(
            top: -5,
            left: (30 - 10) / 2,
            child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ],
      ),
      const SizedBox(height: 8),
      Text(day,
          style: const TextStyle(
              fontSize: 11, color: Colors.black, fontWeight: FontWeight.bold)),
    ],
  );
}

// Placeholder Bars for Thr/Fri
Widget _buildEmptyBar(String day) {
  return Column(
    children: [
      const SizedBox(height: 14), // Space matching the numbers above other bars
      Container(
        width: 32,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      const SizedBox(height: 8),
      Text(
        day,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
    ],
  );
}

Widget thirdtask() {
  return (const Row(
    children: [],
  ));
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDay = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/heart.png',
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Top Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back Button
                      Container(
                        height: 45,
                        width: 45,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      // Day & Week Toggle
                      Container(
                        width: 150,
                        height: 45,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            /// Day
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isDay = true;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: isDay
                                        ? const Color(0xFF2F6B53)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    "Day",
                                    style: TextStyle(
                                      color:
                                          isDay ? Colors.white : Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            /// Week
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isDay = false;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: !isDay
                                        ? const Color(0xFF2F6B53)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    "Week",
                                    style: TextStyle(
                                      color:
                                          !isDay ? Colors.white : Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  /// Title
                  Flexible(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Heart Health",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 20),

                          /// Category Chips
                          Row(
                            children: [
                              chip(
                                "Stretch:78%",
                                const Color(0xFFF7E4F2),
                              ),
                              const SizedBox(width: 10),
                              chip(
                                "Endurance:64%",
                                Colors.greenAccent,
                              ),
                              const SizedBox(width: 10),
                              chip(
                                "Stability:71%",
                                const Color(0xFFF6F3E9),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                              padding: const EdgeInsets.all(6),
                              height: 115,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Sleep Time',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15)),
                                        const Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "7",
                                              style: TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 6),
                                              child: Text(
                                                "h",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "30",
                                              style: TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 6),
                                              child: Text(
                                                "m",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 6),
                                              child: Text(
                                                "last night",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 3),
                                        Row(
                                          children: List.generate(
                                              7,
                                              (index) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(6),
                                                    child: CircleAvatar(
                                                      radius: 10,
                                                      backgroundColor: index < 4
                                                          ? const Color(
                                                              0xffEBCB9B)
                                                          : Colors
                                                              .grey.shade300,
                                                      child: Icon(
                                                        Icons.check,
                                                        size: 12,
                                                        color: index < 4
                                                            ? Colors.brown
                                                            : Colors.grey,
                                                      ),
                                                    ),
                                                  )),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          "assets/moon.png",
                                          height: 90,
                                        ),
                                      ],
                                    ),
                                  ])),
                          const SizedBox(height: 260),
                          Container(
                            padding: const EdgeInsets.all(6),
                            height: 25,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget chip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.all(6),
      height: 35,
      width: 115,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
