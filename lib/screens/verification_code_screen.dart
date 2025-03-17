import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:quarn_app/widgets/login_signup/custom_button.dart';

import 'login_screen.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final FocusNode _pinFocusNode = FocusNode();

  @override
  void dispose() {
    _pinFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0XFFA85000), width: 0.4),
                  ),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
                ),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.topRight,
                child: Text('رمز التحقق',
                    style: GoogleFonts.elMessiri(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: const Color(0XFFA85000),
                    )),
              ),
              const SizedBox(height: 24),
              Text('أدخل الرمز الذي أرسلناه إلى رقمك 012345*****',
                  style: GoogleFonts.elMessiri(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0XFF777777),
                  )),
              const SizedBox(height: 24),
              Center(
                child: Pinput(
                  focusNode: _pinFocusNode,
                  length: 6,
                  defaultPinTheme: PinTheme(
                    width: 50,
                    height: 50,
                    textStyle: GoogleFonts.elMessiri(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  // *عند التركيز (إطار ملون - خلفية بيضاء)*
                  focusedPinTheme: PinTheme(
                    width: 50,
                    height: 50,
                    textStyle: GoogleFonts.elMessiri(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white, // يصبح أبيض عند التركيز
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0XFFA85000), width: 1.5),
                    ),
                  ),
                  // 🔵 **عند إدخال رقم (إطار ملون - خلفية بيضاء دائمًا)**
                  submittedPinTheme: PinTheme(
                    width: 50,
                    height: 50,
                    textStyle: GoogleFonts.elMessiri(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white, // يظل أبيض عند إدخال الأرقام
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0XFFA85000), width: 1.5),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 48),
              CustomButton(title: 'تحقق',onTap: () => _showSuccessDialog(context),
              ),
              SizedBox(height: 24,),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.elMessiri(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    children: [
                      TextSpan(text: 'لم تستلم الرمز؟ '),
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Navigator.pop(context);
                        },
                        text: 'إعادة ارسال ',
                        style: TextStyle(
                          color: Color(0XFFA85000), // لون مختلف للكلمة
                          fontWeight: FontWeight.bold,
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
    );
  }
}


void _showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.grey.shade100,
                child: Icon(Icons.check, color: Color(0XFFA85000), size: 50),
              ),
              const SizedBox(height: 16),
              Text(
                'تم بنجاح',
                style: GoogleFonts.elMessiri(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'لقد تم إعادة تعيين كلمة المرور الخاصة بك بنجاح.',
                textAlign: TextAlign.center,
                style: GoogleFonts.elMessiri(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: CustomButton(
                  title: 'تسجيل الدخول',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>  LoginScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
