import 'package:flutter/material.dart';
import 'package:quarn_app/screens/quarn_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _pages = [
    {
      "image": "assets/images/image 18 (1).png",
      "title": "مرحباً!",
      "description": "ابدأ رحلتك في حفظ القرآن بسهولة وبالوتيرة التي تناسبك."
    },
    {
      "image": "assets/images/image 19 (7).png",
      "title": "خطط مخصصة",
      "description": "ضع أهدافك الخاصة وتلقَّ تذكيرات مخصصة لتبقى على المسار."
    },
    {
      "image": "assets/images/image 20 (1).png",
      "title": "حافظ على التحفيز",
      "description": "استلم تذكيرات يومية وآيات ملهمة تبقيك متصلاً بالقرآن."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      _pages[index]["image"]!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 181,
                    left: 16,
                    child: Container(
                      width: 358,
                      height: 304,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.75),
                          borderRadius: BorderRadius.circular(24)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 38),
                            child: Text(
                              _pages[index]['title']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 26, left: 10),
                            child: SizedBox(

                              child: Text(
                                _pages[index]['description']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             SizedBox(
                               width:156,
                               child: ElevatedButton(onPressed: (){
                                 Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>
                                  LoginScreen()
                                 ) );
                               },
                               style: ElevatedButton.styleFrom(
                                 backgroundColor: Colors.transparent,
                                 padding: const EdgeInsets.symmetric(
                                     horizontal: 30, vertical: 10),
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(31),
                                   side: const BorderSide(
                                       color: Colors.white70,
                                       width: 1),
                                 ),
                               ), child: const Text('تخطي',style: TextStyle(
                                 color: Colors.white70,
                               ),
                               ),),
                             ),
                              SizedBox(
                                width:156,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_currentIndex == _pages.length - 1) {
                                      Navigator.pushReplacement(
                                          context, MaterialPageRoute(builder: (BuildContext context) =>  LoginScreen()));
                                    } else {
                                      _controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(31),
                                      side: const BorderSide(
                                          color: Color(0XFFA85000),
                                          width: 1),
                                    ),
                                  ),
                                  child: const Text(
                                    "متابعة",
                                    style: TextStyle(
                                        color: Color(0XFFA85000), fontSize: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SmoothPageIndicator(
                            controller: _controller,
                            count: _pages.length,
                            effect: const ExpandingDotsEffect(
                              activeDotColor: Colors.orange,
                              dotColor: Colors.white54,
                              dotHeight: 8,
                              dotWidth: 8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
