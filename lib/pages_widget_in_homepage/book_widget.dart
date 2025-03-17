import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quarn_app/pages_widget_in_homepage/details_book_page.dart';

import '../manager/books/book_cubit.dart';
import '../manager/books/book_state.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(builder: (context, state) {
      if (state is LoadedBookState) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 6),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 6,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0XFFA85000),
                          radius: 18,
                          child: Text(
                            '${index+1}',
                            style: GoogleFonts.elMessiri(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(state.books[index].title,
                              style: GoogleFonts.elMessiri(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                        IconButton(
                          onPressed: () {
                            if (state.books.isNotEmpty && state.books[index] != null) {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) => DetailsBookPage(book: state.books[index]),
                              ));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('لا توجد بيانات لهذا الكتاب'))
                              );
                            }
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0XFFA85000),
                            size: 27,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }
      else if(state is ErrorBookState){
        return Center(child: Text(' Error is ${state.message}'),);
      }
      else {
        return const Center(child: CircularProgressIndicator(),);
      }
    });
  }
}
