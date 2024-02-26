import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intflow_test_task/common/calendar_textform.dart';
import 'package:table_calendar/table_calendar.dart';


class Calendar extends StatelessWidget {
  final DateTime? selectedDay;
  final DateTime focusedDay;
  final OnDaySelected? onDaySelected;

  const Calendar(
      {required this.selectedDay,
        required this.focusedDay,
        required this.onDaySelected,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context,) {

    final defaultBoxDeco = BoxDecoration(
      borderRadius: BorderRadius.circular(6.0),
      color: Colors.white,
    );
    final defaultTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
    );

    return TableCalendar(

      locale: 'ko_KR',
      focusedDay: focusedDay,
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      headerStyle: HeaderStyle(
        formatButtonVisible: false, // 주버튼 삭제 : 몇주치의 일정을 보여주는지 확인 하는 버튼
        titleCentered: true, // 헤더 가운데 정돈
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
        ),
      ),
      calendarStyle: CalendarStyle(
          isTodayHighlighted: false, // 오늘날짜가 표시 되는지 안되는지 선택
          weekendDecoration: defaultBoxDeco, // 주말 날짜 데코레이션
          defaultDecoration: defaultBoxDeco, // 평일 날짜 데코레이션
          selectedDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(
                width: 1.0, //너비는 1픽셀
                color: Colors.orange,
              )), //선택된 날짜 데코레이션
          defaultTextStyle: defaultTextStyle, // 평일 글씨 스타일
          weekendTextStyle: defaultTextStyle, // 주말 글씨 스타일
          selectedTextStyle: defaultTextStyle.copyWith(
            color: Colors.green,
          ), // 선택된 글자 스타일  ..... copywith : 기존 스타일을 글대로 가져오고 특정한 값만 바꾸는 기능
          outsideDecoration: BoxDecoration(
            shape: BoxShape.rectangle,
          )),
      onDaySelected: onDaySelected,
      selectedDayPredicate: (DateTime date) {
        if (selectedDay == null) {
          return false;
        }

        return date.year == selectedDay!.year &&
            date.month == selectedDay!.month &&
            date.day == selectedDay!.day;
      },
    );
  }
}