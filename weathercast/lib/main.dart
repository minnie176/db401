import 'package:flutter/material.dart';
import 'package:weathercast/report.dart';



void  main() {
runApp(const MyApp()); //หน้าตาเหมือนเดิมไม่เปลี่ยน เป็น Stl แต่ถ้าเปลี่ยนแปลงเปลี่ยนสี เป็น stl full //
}
//ก้อนด้านล่าง พิมพ์ Stl //
class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return  MaterialApp( //const คือ ค่าคงที่ หากไม่ใส่ก็จะมีการเปลี่ยนแปลง//
      home: Scaffold(
        body: Container(
         constraints: const BoxConstraints.expand(),     //เพื่อขยายให้เต็มพื้นที่หน้าตจอมือถือ//
         decoration: const BoxDecoration( //ตกแต่งด้วย BoxDecoration//
          image: DecorationImage( //ภายใน BoxDecoration ใช้รูปภาพตกแต่ง ด้วย DecorationImage//
            image:AssetImage('images/cloud.gif'), //เลือกใช้รูปภาพจาก Asset ที่ได้ไปตั้งค่าแล้วในไฟล์ Pubspec.yaml//
            fit: BoxFit.cover
          )
         ),
         child: const Report()
        ),
      ), //ตัวจัดการหน้าตาแอพพลิเคชั่น พวก เมนูต่างๆLayout หรือโครงสร้างเค้าโครงของหน้าเเอพ//
    );
  }
}