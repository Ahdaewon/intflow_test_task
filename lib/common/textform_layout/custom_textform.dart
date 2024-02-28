
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final String? formname;
  final VoidCallback? onSelect;
  final IconButton? sufixIconBtn ;
  final bool? starNeed ;

  const CustomTextFormField({
    required this.onChanged,
    this.starNeed,
    this.sufixIconBtn,
    this.autofocus = false,
    this.obscureText = false,
    this.onSelect,
    this.hintText,
    this.errorText,
    this.formname,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final nameHolder =
  TextEditingController(); // x버튼 클릭시 text값을 지우고 value를 delete로 만드는 컨트롤러

  clearTextInput() {
    nameHolder.clear();
  }

  @override
  Widget build(BuildContext context) {
    const baseBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 10),
    );
    String? formname = widget.formname;
    return Column(
      children: [
        Row(
          children: [
            Text(
              '$formname',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
           widget.starNeed != true ? SizedBox() :  Image.asset(
              'assets/icon/star_icon.png',
            ),
          ],
        ),
        TextFormField(
          style: const TextStyle(decorationThickness: 0, fontSize: 14, fontWeight: FontWeight.w500),
          controller: nameHolder,
          cursorColor: Colors.black,
          autofocus: widget.autofocus,
          onChanged: widget.onChanged,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            hoverColor: Colors.greenAccent,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE2E1E1), width: 0),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Color(0xFFE2E1E1), fontSize: 14),
            errorText: widget.errorText,
            errorStyle: const TextStyle(color: Color(0xFFFEA7AB), fontSize: 13),
            fillColor: const Color(0xFFFBFBFB),
            filled: true,
            suffixIcon: widget.sufixIconBtn,
            // IconButton(
            //   onPressed: () {
            //     clearTextInput();
            //     widget.onChanged?.call("delete".trim());
            //   },
            //   icon: Icon(
            //     Icons.clear,
            //     size: 15,
            //     color: Colors.grey[500],
            //   ),
            // ),
            focusedBorder: baseBorder.copyWith(
              borderSide: baseBorder.borderSide
                  .copyWith(color: Colors.purple, width: 2.0),
            ),
          ),
          maxLines: null,
        ),
      ],
    );
  }
}
