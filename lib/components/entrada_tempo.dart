import 'package:flutter/material.dart';
import 'package:pomodoro/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class EntradaTempo extends StatelessWidget {
  final String title;
  final int value;
  final void Function()? inc;
  final void Function()? dec;

  const EntradaTempo({
    super.key,
    required this.title,
    required this.value,
    this.inc,
    this.dec,
  });

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: dec,
              // ignore: sort_child_properties_last
              child: const Icon(
                Icons.arrow_downward,
              ),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15),
                primary: store.estaTrabalhando() ? Colors.red : Colors.green,
              ),
            ),
            Text(
              '$value min',
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: inc,
              // ignore: sort_child_properties_last
              child: const Icon(
                Icons.arrow_upward,
              ),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(15),
                primary: store.estaTrabalhando() ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
