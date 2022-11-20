import 'package:flutter/material.dart';
import 'package:weathercast/forecast.dart';



class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  //ก้อนด้านล่างพิมพ์ init//
  @override
  void initState() {
    forecast()
    .then(
      (weather) => print('${weather.condition}, ${weather.symbol}')
      )
    .catchError(
      (error)=> print(error)
      );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column( //จะมีแกนหลักแนวตั้ง แกนรองแนวนอน//
     mainAxisAlignment: MainAxisAlignment.center,  //กำหนดให้อยู่กลางจอตามแนวตั้ง//
     children:  [ //ระบุสมาชิกใน Column เป็น List//
      const Text(
       'สภาพอากาศวันนี้',
        style: TextStyle(
        fontSize: 36, 
        fontWeight: FontWeight.bold,  //ตัวหนาตัวบาง//
        color: Colors.white //ใส่สีในข้อความ//
         ),
        ), //คั่นระหว่าง 1Text/2Container ด้วย ,//
        Container(
        constraints: const BoxConstraints.tightFor(
         width: 150, 
        height: 150
        ),
        decoration: BoxDecoration(
          color: Colors.blueAccent.shade700.withOpacity(0.7), //กำหยดสี เข้มอ่อน โปรงใส // 
          borderRadius: BorderRadius.circular(10)
        ),
          margin: const EdgeInsets.symmetric(vertical: 30),
        ),
        ElevatedButton(
          onPressed: () {}, 
          child: const Text('Refresh')
        )
      ],
     );
    }
  }