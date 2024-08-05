import 'package:flutter/material.dart';
import 'package:poc_ml/n_z_log.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              NZLog.error(msg: 'Olá');
            },
            child: Container(
              height: 50,
              width: double.infinity,
              color: Colors.amber,
              child: const Text('Olá mundp'),
            ),
          ),
        ],
      ),
    );
  }
}
