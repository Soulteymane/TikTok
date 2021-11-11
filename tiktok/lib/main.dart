import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/splashScreen.dart';
import 'package:tiktok/videoplayer.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiktok',
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Acceuil',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/decouvrir.png"),
            ),
            label: 'Découvrir',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/icons/tiktok_add.png",
              height: 35,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Boite de réception',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List<Map> tiktokItems = [
    {
      "video": "assets/videos/A1.mp4",
    },
    {
      "video": "assets/videos/A2.mp4",
    },
    {
      "video": "assets/videos/A3.mp4",
    },
    {
      "video": "assets/videos/A4.mp4",
    },
    {
      "video": "assets/videos/video_5.mp4",
    },
    {
      "video": "assets/videos/video_6.mp4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: double.infinity,
          scrollDirection: Axis.vertical,
          viewportFraction: 1.0),
      items: tiktokItems.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              //color: Colors.amber,
              child: Stack(
                children: [
                  VideoWidget(videoUrl: item['video']),
                  MyContent(),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class MyContent extends StatelessWidget {
  const MyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          padding: EdgeInsets.only(top: 40),
          //color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Abonnement',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'Pour toi',
                style: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  //color: Colors.red.withOpacity(0.5),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '@lilbenodt',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '#duo avec @oudemill sur la musique du moment',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.music_note,
                            color: Colors.white,
                            size: 15,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'musique original de Oude mill-Bonne fête',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 80,
                //color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 80,
                      // color: Colors.teal,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage:
                                  AssetImage('assets/images/lilben.jpg'),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      //color: Colors.purple,
                      child: Column(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.white.withOpacity(0.85),
                            size: 45,
                          ),
                          Text(
                            '30.1K',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      child: Column(
                        children: [
                          Icon(
                            Icons.comment,
                            color: Colors.white.withOpacity(0.85),
                            size: 45,
                          ),
                          Text(
                            '245',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      child: Column(
                        children: [
                          Icon(
                            Icons.share,
                            color: Colors.white.withOpacity(0.85),
                            size: 45,
                          ),
                          Text(
                            '29',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 80,
                      child: Column(
                        children: [
                          Icon(
                            Icons.power_input_sharp,
                            color: Colors.white.withOpacity(0.85),
                            size: 45,
                          ),
                        ],
                      ),
                    ),
                    AnimtedMusicLogo(),
                    SizedBox(height: 10),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class AnimtedMusicLogo extends StatefulWidget {
  const AnimtedMusicLogo({Key? key}) : super(key: key);

  @override
  _AnimtedMusicLogoState createState() => _AnimtedMusicLogoState();
}

class _AnimtedMusicLogoState extends State<AnimtedMusicLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    );

    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value = 2 * math.pi,
          child: child,
        );
      },
      child: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(35),
          image: DecorationImage(
            image: AssetImage('assets/icons/disc_icon.png'),
          ),
        ),
        child: Image.asset('assets/icons/tiktok_icon.png'),
      ),
    );
  }
}
