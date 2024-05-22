import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {

  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Contador',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)
            )
          ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$counter',
              style: const TextStyle(
                fontSize: 90,
                fontWeight: FontWeight.w200
              )
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MyFloatingButton(
            icon: Icons.refresh,
            onPress: (){
              setState(() {
                counter=0;
            });
          }),
          const SizedBox(height: 15,),
          MyFloatingButton(
            icon: Icons.plus_one_outlined,
            onPress: (){
              setState(() {
                counter++;
            });
          }),
          const SizedBox(height: 15,),
          MyFloatingButton(
            icon: Icons.exposure_minus_1_outlined,
            onPress: (){
              if(counter==0) return;
              setState(() {
                counter--;
              });
            }
          )
        ],
      )
    );
  }
}

class MyFloatingButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;

  const MyFloatingButton({
    super.key,
    required this.icon,
    required this.onPress
  });


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPress,
      child: Icon(icon),
    );
  }
}