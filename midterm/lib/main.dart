import 'package:flutter/material.dart';

void main() {
 int score=0;
  runApp(MaterialApp());
    }
    class MyPanel extends StatelessWidget {
  const MyPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),  
        decoration: const BoxDecoration(
          image: DecorationImage( 
            image:AssetImage('images/bg.webp'), 
            fit: BoxFit.cover
          )
        ), 
      ),
    ),
    theme: ThemeData(
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold
         ),
        )
      )
    

    );
    
  }
}
    
  class Mypanel extends StatefulWidget {
  const Mypanel({super.key});

  @override
  State<Mypanel> createState() => _MypanelState();
}

class _MypanelState extends State<Mypanel> {
score? _score;
@override
  void initState() {
    updateReport();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        ElevatedButton(
        onPressed: () {}, 
        child: const Text('+'),
        ),
         Text(
                '${_score!.temperature}', 
                style: Theme.of(context).textTheme.displayLarge,
            ),
             
         ElevatedButton(
        onPressed: () {}, 
        child: const Text('-')
         )
      ]
      
    );
  
  }
}
  
void updateReport() {
   forecast().then((score) {  
    setState(() {
    _score = score;
});
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
 })
 .catchError((error) {
  ScaffoldMessenger.of(context).showSnackBar( 
  SnackBar(
   content: Text(error.toString()), 
  duration: const Duration(days: 1),
  )
  );
 });
}