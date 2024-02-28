import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:intflow_test_task/common/calendar_screen.dart';
import 'package:intl/intl.dart';


final selectDateProvider = StateProvider<String?>((ref) => null);

class CalendarTextform extends StatefulWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final String? formname;
  final VoidCallback? onSelect;
  final IconButton? sufixIconBtn;
  final bool? starNeed;

  const CalendarTextform({
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
  State<CalendarTextform> createState() => _CalendarTextformState();
}

class _CalendarTextformState extends State<CalendarTextform> {
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
            widget.starNeed != true
                ? SizedBox()
                : Image.asset(
                    'assets/icon/star_icon.png',
                  ),
          ],
        ),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            ref.watch(selectDateProvider) ;
            final selecDatateState = ref.read(selectDateProvider);
            if(selecDatateState != null){
              nameHolder.text= "${ref.read(selectDateProvider)}";
              widget.onChanged?.call("${ref.read(selectDateProvider)}".trim());
            }

            return TextFormField(
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
                suffixIcon: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return const CalendarTest();
                        });

                  },
                  icon: Image.asset(
                    'assets/icon/calendar_icon.png',
                  ),
                ),
                focusedBorder: baseBorder.copyWith(
                  borderSide: baseBorder.borderSide
                      .copyWith(color: Colors.purple, width: 2.0),
                ),
              ),
              maxLines: null,
            ) ;
          },

        ),
      ],
    );
  }
}

class CalendarTest extends ConsumerStatefulWidget {
  const CalendarTest({super.key});

  @override
  ConsumerState<CalendarTest> createState() => _CalendarTestState();
}

class _CalendarTestState extends ConsumerState<CalendarTest> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Calendar(
              selectedDay: selectedDay,
              focusedDay: focusedDay,
              onDaySelected: onDaySelected),
        ],
      ),
    );
  }

  onDaySelected(DateTime selectedDay, DateTime focuseDay) {

    ref.read(selectDateProvider.notifier).update((state) => DateFormat('yyyy-MM-dd').format(selectedDay));

    setState(() {
      this.selectedDay = selectedDay; // selectDay : 클릭된 날짜
      this.focusedDay = selectedDay;
    });
  }
}
