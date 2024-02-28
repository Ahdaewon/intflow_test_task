import 'package:flutter/material.dart';

class DropDownTextForm extends StatefulWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final String? formname;
  final VoidCallback? onSelect;
  final IconButton? sufixIconBtn;
  final bool? starNeed;

  const DropDownTextForm({
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
  State<DropDownTextForm> createState() => _DropDownTextFormState();
}

class _DropDownTextFormState extends State<DropDownTextForm> {
  final nameHolder =
      TextEditingController(); // x버튼 클릭시 text값을 지우고 value를 delete로 만드는 컨트롤러

  clearTextInput() {
    nameHolder.clear();
  }

  String dropDownValue = "선택해주세요";

  @override
  Widget build(BuildContext context) {
    // 드롭다운 리스트
    List<String> dropDownList = ["선택해주세요",'관찰위치1', '관찰위치2', '관찰위치3','관찰위치4','관찰위치5'];

    // 초기값 설정
    if (dropDownValue == "") {
      dropDownValue = dropDownList.first;
    }

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
            widget.starNeed != true
                ? SizedBox()
                : Image.asset(
                    'assets/icon/star_icon.png',
                  ),
          ],
        ),
        TextFormField(
         readOnly: true,
          style: const TextStyle(
              decorationThickness: 0,
              fontSize: 14,
              fontWeight: FontWeight.w500),
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
            suffixIcon: DropdownButton(
              // 드롭다운 버튼에 처음 보여질 값
              value: dropDownValue,
              // 드롭다운의 리스트를 보여줄 값
              items: dropDownList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              // 드롭다운의 값을 선택했을 경우
              onChanged: (String? value) {
                setState(() {
                  nameHolder.text= "$value";
                  widget.onChanged?.call("$value".trim());
                  dropDownValue = value!;
                  print(dropDownValue);
                });
              },
            ),
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
