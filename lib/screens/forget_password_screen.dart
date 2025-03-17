import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quarn_app/screens/verification_code_screen.dart';

import '../widgets/login_signup/custom_button.dart';
import '../widgets/login_signup/custom_text_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
   ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: const Color(0XFFA85000), width: 0.4)),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
                ),
                const SizedBox(
                  height: 24,
                ),
               Align(
                 alignment: Alignment.topRight,
                 child: Text('نسيت كلمة المرور؟',
                    style: GoogleFonts.elMessiri(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: const Color(0XFFA85000),
                 )),
               ),
                const SizedBox(
                  height: 24,
                ),
                Text('أدخل بريدك الإلكتروني لإعادة تعيين كلمة المرور الخاصة بك، وسنرسل لك رمز التأكيد',
                style: GoogleFonts.elMessiri(
                  fontSize: 14,
                  color: const Color(0XFF777777),
                ),
                ),
                const SizedBox(
                  height: 48,
                ),
                CustomTextField(title: 'البريد الالكتروني', hint: 'ادخل بريدك الالكتروني', controller: emailController,),
                const SizedBox(
                  height: 24,
                ),
                CustomButton(title: 'ارسال', onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>  VerificationCodeScreen()));
                },),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
