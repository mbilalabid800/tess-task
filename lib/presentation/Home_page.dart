import 'package:flutter/material.dart';
import 'dock_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: DockWidget(),
          ),
        ],
      ),
    );
  }
}
