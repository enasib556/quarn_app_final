import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfViewScreen extends StatelessWidget {
  final String url;
  final String title;
  const PdfViewScreen({super.key, required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    print("Download URL: $url");
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title:  Text('عرض ${title}', style: TextStyle(color: Colors.white)),
          backgroundColor: const Color(0xFF0522700),
          actions:[IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_forward_ios,color: Colors.white,)) ,]
        ),
          body: const PDF().cachedFromUrl(
          url,
          placeholder: (progress) => Center(child: Text(' $progress%')),
          errorWidget: (error) => Center(child: Text(' error during doumnload is ${error} ')),
        ),
      ),
    );
  }
}
