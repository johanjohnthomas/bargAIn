import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchInputFb2 extends StatelessWidget {
  final TextEditingController searchController;
  final String hintText;

  const SearchInputFb2(
      {required this.searchController, required this.hintText, Key? key})
      : super(
          key: key,
        );
  final primaryColor = const Color.fromRGBO(34, 179, 174, 1);
  final secondaryColor = const Color.fromRGBO(75, 173, 86, 1);
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(75, 173, 86, 1),
            Color.fromRGBO(34, 179, 174, 1)
          ]),
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 20,
                spreadRadius: 1,
                color: Colors.grey.withOpacity(1)),
          ]),
      child: TextField(
        controller: searchController,
        textAlign: TextAlign.center,
        onChanged: (value) {},
        style: TextStyle(fontSize: 14, color: accentColor),
        decoration: InputDecoration(
          // prefixIcon: Icon(Icons.email),
          prefixIcon: Icon(Icons.search, size: 20, color: accentColor),
          filled: true,
          fillColor: Colors.transparent,
          hintText: hintText,
          hintStyle: TextStyle(color: accentColor.withOpacity(.75)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
      ),
    );
  }
}
