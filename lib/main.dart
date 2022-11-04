import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:video_player/video_player.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  //widget de base pour creer une app

  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'tikodk',
        debugShowCheckedModeBanner: false,
        home: MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

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
      // appBar: AppBar(
      //   title: const Text('Tik_ODK'),
      // ),
      body: Accueil(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
            //  backgroundColor: Colors.red,
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.flash_on_sharp),
          
            label: 'flash',
            //backgroundColor: Color.fromARGB(255, 11, 11, 11),
          ),
         
             BottomNavigationBarItem(
            //icon: Icon(Icons.flash_auto),
            icon: Image.asset('assets/images/add.png', height: 25),
            label: 'add',
            //backgroundColor: Color.fromARGB(255, 11, 11, 11),
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.comment_outlined), label: 'ahh'),

          // backgroundColor: Color.fromARGB(255, 10, 9, 10),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'profil',
            // backgroundColor: Color.fromARGB(255, 6, 6, 6),
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF141518),
        selectedItemColor: Color.fromARGB(255, 11, 11, 11),
        unselectedItemColor: Color.fromARGB(255, 246, 243, 243),
        //pour enlever le texte en dessous des icones
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Accueil extends StatelessWidget {
  Accueil({super.key});
  final List<Map> tikodkItems = [
    {
      "video": "assets/videos/vid.mp4",
    },
    {
      "video": "assets/videos/vid2.mp4",
    },
    {
      "video": "assets/videos/vid3.mp4",
    },
    // {
    //   "video": "assets/videos/vid.mp4",
    // },
    // {
    //   "video": "assets/videos/vid.mp4",
    // },
    // {
    //   "video": "assets/videos/vid.mp4",
    // },
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        //pour que ça prenne toute la page
        height: double.infinity,

        scrollDirection: Axis.vertical,
        //cette propriété fera en sorte q la vidéo prenne toute la page
        viewportFraction: 1.0,
      ),
      //parcourir la liste tikodc item
      items: tikodkItems.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              color: const Color(0xFF141518),
              child: Stack(
                children: [
                  VideoWidget(videoUrl: i['video']),
                  PostContent()
                  //le const prckil n'est pas statique
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class VideoWidget extends StatefulWidget {
  const VideoWidget({super.key, required this.videoUrl});
  //une nouvelle variable/declaration de la video
  final String videoUrl;

  @override
  State<VideoWidget> createState() => _VideoWidgetState(this.videoUrl);
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;
  final String videoUrl;
  _VideoWidgetState(this.videoUrl);

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(videoUrl)
      ..initialize().then((_) {
        //Pour lire la video
        _controller.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(_controller);
  }
}

//un widget qui va contenir tout le contenu des post
class PostContent extends StatelessWidget {
  const PostContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          padding: EdgeInsets.only(top: 40),
          // color: Colors.blue,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Suivi',
              style:
                  TextStyle(color: Colors.white54, fontWeight: FontWeight.w900),
            ),
            //mettre de l'espace
            SizedBox(width: 20),

            Text(
              'Pour toi',
              style:
                  TextStyle(color: Colors.white54, fontWeight: FontWeight.w900),
            )
          ]),
        ),
        Expanded(
          child:
              // color: Colors.red,
              Row(children: [
            Expanded(
              child: Container(
                // color: Colors.red.withOpacity(0.5),
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.end, //alignement en bas
                    crossAxisAlignment:
                        CrossAxisAlignment.start, //alignement à gauche
                    children: [
                      const Text(
                        'Djoballa Officiel',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'hhdhsdhshjsjsdhsdj.hqdhsjdj.jdqj#jsdjhc',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Icon(
                            Icons.music_note,
                            color: Colors.white,
                            size: 15,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Titre du sonxxxxxx ',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ]),
              ),
            ),
            Container(
              width: 80,
              padding: const EdgeInsets.only(bottom:10),
              // color: Colors.green,
              child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.end, //pour mettre  la boite en bas
                  children: [
                    SizedBox(
                      height: 60,
                      //color: Colors.yellow,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage('assets/images/tony.webp'),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      // color: Color.fromARGB(255, 41, 48, 53),
                      child: Column(children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.white.withOpacity(0.85),
                          size: 40,
                        )
                      ]),
                    ),
                    Container(
                      height: 60,
                      // color: Color.fromARGB(255, 183, 32, 32),
                      child: Column(children: [
                        Icon(
                          Icons.chat,
                          color: Colors.white.withOpacity(0.85),
                          size: 40,
                        )
                      ]),
                    ),
                    Container(
                      height: 60,
                      //color: Colors.white,
                      child: Column(children: [
                        Icon(
                          Icons.bookmark,
                          color: Colors.white.withOpacity(0.85),
                          size: 40,
                        )
                      ]),
                    ),
                    Container(
                      height: 50,
                      //color: Colors.white,
                      child: Column(children: [
                        Icon(
                          Icons.share,
                          color: Colors.white.withOpacity(0.85),
                          size: 40,
                        )
                      ]),
                    ),
                    const LogoW(

                    ),
                    
                  ]),
            )
          ]),
        ),

      ],
    );
  }
}

class LogoW extends StatefulWidget {
  const LogoW({super.key});

  @override
  State<LogoW> createState() => _LogoWState();
}

class _LogoWState extends State<LogoW> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
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
          angle: _controller.value * 2 * math.pi,
          child: child,
        );
      },
      child: Container(
        height: 45,
        width: 45,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image:const DecorationImage(
          image: const AssetImage("assets/images/di.png")
        ),
      ),
      child: Image.asset('assets/images/tok.png'),
      ),
    );
  }
}
