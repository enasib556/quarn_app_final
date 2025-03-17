import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quarn_app/screens/forget_password_screen.dart';
import 'package:quarn_app/screens/sign_in_screen.dart';
import 'package:quarn_app/screens/static_navigation_bar_app_bar_screen.dart';
import 'package:quarn_app/widgets/login_signup/container_scoial.dart';
import 'package:quarn_app/widgets/login_signup/custom_button.dart';
import 'package:quarn_app/widgets/login_signup/custom_login_container.dart';

import '../widgets/login_signup/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 39
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (rect) => const LinearGradient(
                    colors: [
                      Color(0XFF522700),
                      Color(0XFFA85000),
                    ],
                  ).createShader(rect),
                  blendMode: BlendMode.srcIn,
                  child: Text(
                    'القران الكريم',
                    style: GoogleFonts.elMessiri(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                SizedBox(
                  width: 276,
                  child: Text(
                    'قم بتسجيل الدخول أو إنشاء حساب جدبد لحفظ تقدمك',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.elMessiri(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0XFF777777),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  width: 358,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0XffEDEEEF),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const CustomLoginContainer(
                        title: 'تسجيل الدخول',
                        fontSize: 16,
                        color: Colors.white,
                        textColor: Color(0XFFA85000),
                      ),
                      InkWell(
                        onTap: ()=> Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>   SignInScreen())),
                        child: const CustomLoginContainer(
                            title: 'إنشاء حساب',
                            fontSize: 16,
                            color: Colors.transparent,
                            textColor: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomTextField(title: 'البريد الالكتروني', hint: 'ادخل بريدك الالكتروني', controller: emailController,),
                const SizedBox(
                  height: 24,
                ),
                 CustomTextField(title: 'كلمة المرور', hint: 'ادخل كلمة المرور', controller: passwordController,),
                const SizedBox(
                  height: 16,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>   ForgetPasswordScreen()));
                        },
                        child: Text('نسيت كلمة المرور؟', style: GoogleFonts.elMessiri(fontSize: 14, color: const Color(0XFFA85000)),))),
                const SizedBox(
                  height: 64,
                ),
                CustomButton(
                 title: 'تسجيل الدخول',
                 onTap: (){
                   Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>   StaticNavigationBarAppBarScreen()));
                 },
               ),
                const SizedBox(
                  height: 48,
                ),
                Text('خيارات تسجيل الدخول الأخرى', style: GoogleFonts.elMessiri(fontSize: 14, color: Colors.black),),
                const SizedBox(
                  height: 24,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    ContainerSocial(icon: 'assets/icons/Apple.png'),
                    SizedBox(width: 16,),
                    ContainerSocial(icon: 'assets/icons/Google.png'),
                    SizedBox(width: 16,),
                    ContainerSocial(icon: 'assets/icons/Frame 36695.png'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
