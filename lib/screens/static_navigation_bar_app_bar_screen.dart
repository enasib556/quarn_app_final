import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quarn_app/pages_widget_in_homepage/profile_widget.dart';
import 'package:quarn_app/pages_widget_in_homepage/tasbah_widget.dart';

import '../pages_widget_in_homepage/book_widget.dart';
import '../pages_widget_in_homepage/home_widget.dart';
import '../pages_widget_in_homepage/khotab_widget.dart';

class StaticNavigationBarAppBarScreen extends StatefulWidget {
  const StaticNavigationBarAppBarScreen({super.key});

  @override
  State<StaticNavigationBarAppBarScreen> createState() => _StaticNavigationBarAppBarScreenState();
}

class _StaticNavigationBarAppBarScreenState extends State<StaticNavigationBarAppBarScreen> {
  int _page = 4;
   List<Widget> pages = [
    const ProfileWidget(),
     TasbahWidget(),
     BookWidget(),
     KhotabWidget(),
     HomePage(),
   ];
    List<String> titles = [
      '',
      'التسبيح',
      'كتب دينيه',
      'خطب',
    ];
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: (_page == 4)||(_page==0) ? null : AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            (_page < titles.length) ? titles[_page] : '',
            style: GoogleFonts.elMessiri(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF522700),
        ),
        body: pages[_page],
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 4,
          items:  <Widget>[
            SvgPicture.asset('assets/icons/ep_setting.svg'),
            SvgPicture.asset('assets/icons/icon-park-outline_two-hands.svg'),
            SvgPicture.asset('assets/icons/fluent-emoji-high-contrast_open-book.svg'),
            SvgPicture.asset('assets/icons/ph_mosque.svg'),
            SvgPicture.asset('assets/icons/tabler_home-filled.svg'),
          ],
          color: const Color(0xFF522700),
          buttonBackgroundColor: const Color(0xFF522700),
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOutBack,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}
