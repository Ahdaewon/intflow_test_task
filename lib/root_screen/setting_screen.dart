import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intflow_test_task/common/textform_layout/calendar_textform.dart';
import 'package:intflow_test_task/common/textform_layout/custom_textform.dart';
import 'package:intflow_test_task/common/textform_layout/dropdown_textform.dart';
import 'package:intflow_test_task/root_screen/store_confirm.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String? alramName;
  String? alramMemo;
  String? alramPosition;
  String? alramDate;

  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    setState(() {
      alramDate = null;
      alramName = null;
      alramMemo = null;
      alramPosition = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 다른 부분을 터치하면 포커스 제거
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "설정",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "맞춤 알림 수정",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    hintText: '알림 이름을 입력해주세요',
                    formname: '알림 이름',
                    starNeed: true,
                    onChanged: (String value) {
                      setState(() {
                        alramName = value;
                      });
                    },
                  ),
                  DropDownTextForm(
                    hintText: '위치를 선택해주세요.',
                    formname: '관찰 위치',
                    starNeed: true,
                    onChanged: (String value) {
                      setState(() {
                        alramPosition = value;
                      });
                    },
                  ),
                  CalendarTextform(
                    hintText: '날짜를 선택해주세요.',
                    formname: '날짜',
                    starNeed: true,
                    onChanged: (String value) {
                      // setState(() {
                      //   alramDate = value ;
                      // });
                    },
                  ),
                  CustomTextFormField(
                    hintText: '메모를 입력해주세요.',
                    formname: '메모',
                    onChanged: (String value) {
                      setState(() {
                        alramMemo = value;
                      });
                    },
                  ),
                ],
              ),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  ref.watch(selectDateProvider);
                  alramDate = ref.read(selectDateProvider);
                  return ElevatedButton(
                    onPressed: () async {
                      print(alramMemo);
                      print(alramName);
                      print(alramPosition);
                      FocusScope.of(context).requestFocus(FocusNode());
                      await Future.delayed(const Duration(milliseconds: 500));
                      // 키보드 닫히는 시간으로 인해서 future.delay 적용 (화면 오버플로 방지)
                      (alramName == null ||
                              alramName == "" ||
                              alramPosition == null ||
                              alramPosition == "" ||
                              alramPosition == "선택해주세요" ||
                              alramDate == null ||
                              alramDate == "")
                          ? null
                          : Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => StoreConfirmScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(0, 50),
                      // String? authName;
                      // String? authPhoneNum;
                      // String? authNum;
                      backgroundColor: (alramName == null ||
                              alramName == "" ||
                              alramPosition == null ||
                              alramPosition == "" ||
                              alramPosition == "선택해주세요" ||
                              alramDate == null ||
                              alramDate == "")
                          ? Colors.grey
                          : Color(0xFF0247B4),
                      //PRIMARY_COLOR,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text(
                      '저장',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
