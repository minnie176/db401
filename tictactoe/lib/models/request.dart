import 'package:flutter/material.dart';

class Request extends StatelessWidget {
 final String gameId;
 final String challenger;
 final Function onAccept;

 const Request({
   required this.gameId, 
   required this.challenger, 
   required this.onAccept,
   super.key
 });

  @override
  Widget build(BuildContext context) {
     return ListTile(
   title: Text(challenger),
   trailing: ElevatedButton( //ด้านหลังให้เป็นปุ่ม //
     onPressed: () => onAccept(gameId), //เมื่อกดปุ่มแล้วให้เป็น onAccept เข้าเกมที่มีคนท้าเอาไว้ //
     child: const Text('Accept')
   ),
 );
  }
}
