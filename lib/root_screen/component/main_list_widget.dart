import 'package:flutter/material.dart';

class MainListContainer extends StatelessWidget {

  final String bigTitle ;
  final String donCount;
  final String doCount;
  final bool deviceStatus;
  const MainListContainer({
    required this.bigTitle,
    required this.doCount,
    required this.donCount,
    required this.deviceStatus,
    super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 2 / 7,
        height: 90,
        decoration: BoxDecoration(

          borderRadius:
          const BorderRadius.all(Radius.circular(13)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                bigTitle,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  const Text(
                    '돈방',
                    style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF878787)),
                  ),
                  Text(
                    " $donCount",
                    style: TextStyle(fontSize: 10),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Image.asset(
                    'assets/main_content_icon/seperate_icon.png',
                    height: 8,
                    color: Color(0xFFD0D0D0),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    donCount,
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(13),
                  bottomRight: Radius.circular(13),
                ),
                color: deviceStatus == true ?  Color(0xFF37B24D) : Color(0xFFF03E3E),
              ),
              height: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(),
                  Image.asset(
                    'assets/main_content_icon/device_icon.png',
                  ),
                  const Text("장치상태" , style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white
                  ),
                  ),SizedBox(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
