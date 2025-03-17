import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quarn_app/screens/static_navigation_bar_app_bar_screen.dart';

import '../widgets/login_signup/container_scoial.dart';
import '../widgets/login_signup/custom_button.dart';
import '../widgets/login_signup/custom_login_container.dart';
import '../widgets/login_signup/custom_text_field.dart';
import 'login_screen.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isSelected = false;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
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
                    height: 15,
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
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginScreen()));
                          },
                          child: const CustomLoginContainer(
                            title: 'تسجيل الدخول',
                            fontSize: 16,
                            color: Colors.transparent,
                            textColor: Colors.black,
                          ),
                        ),
                        const CustomLoginContainer(
                            title: 'إنشاء حساب',
                            fontSize: 16,
                            color: Colors.white,
                            textColor: Color(0XFFA85000)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    title: 'البريد الالكتروني',
                    hint: 'ادخل بريدك الالكتروني',
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    title: 'كلمة المرور',
                    hint: 'ادخل كلمة المرور',
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextField(
                    title: 'تاكيد كلمة المرور',
                    hint: 'ادخل كلمة المرور',
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            shape: BoxShape.rectangle,
                            border: isSelected
                                ? null
                                : Border.all(color: Colors.black, width: 0.5),
                            color: isSelected
                                ? const Color(0XFFA85000)
                                : Colors.transparent),
                        child: isSelected
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(width: 5,),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.elMessiri(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        children: const[
                          TextSpan(text: 'أوافق على '),
                          TextSpan(
                            text: 'شروط خدمة ',
                            style: TextStyle(
                              color: Color(0XFFA85000), // لون مختلف للكلمة
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: 'و'),
                          TextSpan(
                            text: ' سياسة الخصوصية',
                            style: TextStyle(
                              color: Color(0XFFA85000), // لون مختلف للكلمة
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 32,
                  ),
                   CustomButton(
                     title: 'تسجيل الدخول',
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => StaticNavigationBarAppBarScreen()));
                     },
                   ),
                  const SizedBox(
                    height: 32,
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
      ),
    );
  }
}
