import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class Pair<T1, T2> {
  final T1 item1;
  final T2 item2;

  Pair(this.item1, this.item2);
}

List<String> localities = ["Sunderban"];
