import 'package:flutter/material.dart';

class SearchTextFormField extends StatelessWidget {
  final ValueChanged<String>? onFieldSubmitted;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final VoidCallback? onTap;



  const SearchTextFormField({
    required this.hintText,
    this.onFieldSubmitted,
    this.onChanged,
    this.controller,
    this.onTap,
    super.key,
    });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        //
        cursorColor: Colors.black12,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: null,
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 18, minHeight: 18),
          isDense: true,
          fillColor: const Color(0xFFF4F4F4),
          suffixIcon: onTap == null
              ? null
              : IconButton(
            onPressed: () {

            },
            icon: Image.asset(
              'assets/main_content_icon/search_icon.png',
            ),
          ),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xFFB9BABF)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );

  }
}
