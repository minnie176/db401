import 'package:flutter/material.dart';
import 'package:weathercast/forecast.dart';
import 'package:weathercast/weather.dart';



class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  Weather? _weather;
  //ก้อนด้านล่างพิมพ์ init//
  @override
  void initState() {
    updateReport();
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
        constraints:  _weather == null ? const BoxConstraints.tightFor(  //?คือ ในกรณีใช่ //
         width: 150, 
        height: 150
        ): null,
        decoration: BoxDecoration(
          color: Colors.blueAccent.shade700.withOpacity(0.7), //กำหยดสี เข้มอ่อน โปรงใส // 
          borderRadius: BorderRadius.circular(10)
        ),
          margin: const EdgeInsets.symmetric(vertical: 30),
          padding: const EdgeInsets.all(20), //all คือทุกด้านซ้ายขวา //
          child: _weather == null ? null : Column( //ถ้าweather เป็นค่าว่างก็จะว่างไปเลย เเต่ถ้าไม่ใช้จะเป็น การสร้างคอลัมเเทน//
         children: [
            Text(
                _weather!.address, //ที่อยู่ //
                textAlign: TextAlign.center, //กำหนดให้อยู่กึ่งกลาง//
                style: Theme.of(context).textTheme.bodyText1,//การเลือกตรีม//
            ),
                const SizedBox(height: 20,), //กำหนดขนาดไซต์บล๊อค//
            Text(
                '${_weather!.temperature}℃', //อุณภูมิ//
                style: Theme.of(context).textTheme.headline1,
            ),
                const SizedBox(height: 20,),
            Text(
                _weather!.condition,
                style: Theme.of(context).textTheme.caption,
            ),
                const SizedBox(height: 20,),
            Text(
                  _weather!.symbol,
                  style: const TextStyle(
                  fontSize: 72
                    ),
                  ),
                  ]
                ),
    ),
        ElevatedButton(
          onPressed: () { 
          updateReport();
          }, 
          child: const Text('Refresh')
        )
      ],
     );
    }

 void updateReport() {
   forecast().then((weather) {  //(weather)//สามารุถเป็นตัวแปลชื่ออะไรก็ได้//
    setState(() {
    _weather = weather;
});
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
 })
 .catchError((error) {
  ScaffoldMessenger.of(context).showSnackBar( //ถ้ามีerror ให้โชวข้อความสั้น ข้อความอะไรทระยะเวลาเท่าไหร่//
  SnackBar(
   content: Text(error.toString()), //ข้อความที่แสดง//
  duration: const Duration(days: 1),// ระยะเวลา//
    )
  );
 });

 }
}