import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/cronometro.dart';
import 'package:pomodoro/components/entrada_tempo.dart';
import 'package:pomodoro/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Dessa forma não precisa passar os dados via parâmetro. Vão
    //através do Provider.
    final store = Provider.of<PomodoroStore>(context);

    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(
          child: Cronometro(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Observer(
            builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                EntradaTempo(
                  title: 'Trabalho',
                  value: store.tempoTrabalho,
                  inc: store.iniciado && store.estaTrabalhando()
                      ? null
                      : store.incrementarTempoTrabalho,
                  dec: store.iniciado && store.estaTrabalhando()
                      ? null
                      : store.decrementarTempoTrabalho,
                ),
                EntradaTempo(
                  title: 'Descanso',
                  value: store.tempoDescanso,
                  inc: store.iniciado && store.estaDescansando()
                      ? null
                      : store.incrementarTempoDescanso,
                  dec: store.iniciado && store.estaDescansando()
                      ? null
                      : store.decremantarTempoDescanso,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
