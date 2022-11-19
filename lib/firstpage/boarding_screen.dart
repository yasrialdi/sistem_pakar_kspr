import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'login.dart';

class PageBoardingScreen extends StatefulWidget {
  const PageBoardingScreen({Key? key}) : super(key: key);

  @override
  _PageBoardingScreenState createState() => _PageBoardingScreenState();
}

class _PageBoardingScreenState extends State<PageBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Ubuntu',
          color: Colors.white),
    );

    return IntroductionScreen(
      key: introKey,
      scrollPhysics: ClampingScrollPhysics(),
      globalHeader: Align(
        alignment: Alignment.center,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/launcher.png',
                    height: 220,
                    width: 230,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Cek Resiko Kehamilan\ndengan mudah",
          body: "",
          image: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/boar1.jpg'), fit: BoxFit.cover),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.2),
            )
          ]),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 1,
            imageFlex: 2,
          ),
        ),
        PageViewModel(
          title: "Proses cek kehamilan\nyang sangat cepat",
          body: '',
          image: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/boar2.jpg'), fit: BoxFit.cover),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.3),
            )
          ]),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 1,
            imageFlex: 2,
          ),
        ),
        PageViewModel(
          title: "Cek Kehamilan\nSekarang Juga",
          bodyWidget: Padding(
            padding: const EdgeInsets.only(top: 35),
            child: MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => PageLogin()));
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              height: 40,
              minWidth: 171,
              child: Text(
                'Mulai Cek',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Ubuntu',
                    color: Colors.white),
              ),
              color: Colors.pinkAccent,
            ),
          ),
          image: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/boar3.jpg'), fit: BoxFit.cover),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.3),
            )
          ]),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 1,
            imageFlex: 2,
          ),
        ),
      ],
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text(
        'Lewati',
        style: TextStyle(
          fontSize: 14,
          fontFamily: 'Ubuntu',
          color: Colors.white,
        ),
      ),
      next: const Text(
        'Selanjutnya',
        style: TextStyle(
          fontSize: 12,
          fontFamily: 'Ubuntu',
          color: Colors.white,
        ),
      ),
      nextColor: Colors.transparent,
      showNextButton: false,
      showDoneButton: false,
      dotsDecorator: const DotsDecorator(
        size: Size(13, 13),
        color: Color(0xFFFF80AB),
        activeColor: Colors.pinkAccent,
        activeSize: Size(22, 13),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
