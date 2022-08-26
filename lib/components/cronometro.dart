import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/cronometro_botao.dart';
import 'package:pomodoro/store/pomodoro_store.dart';
import 'package:provider/provider.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Observer(
      builder: (_) {
        return Container(
          color: store.estaTrabalhando() ? Colors.red : Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                store.estaTrabalhando()
                    ? 'Hora de Trabalhar'
                    : 'Hora de Descanso',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                //para aparecer 2 casas decimais coloca toString().padLeft
                '${store.minutos.toString().padLeft(2, '0')}:${store.segundos.toString().padLeft(2, '0')}',
                style: const TextStyle(
                  fontSize: 120,
                  color: Colors.white,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              //BOTÕES

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Se não começou, aparece o botão
                  if (!store.iniciado)
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CronometroBotao(
                        texto: 'INICIAR',
                        icone: Icons.play_arrow,
                        click: store.iniciar,
                      ),
                    ),
                  //Se começou, o botão desaparece
                  if (store.iniciado)
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CronometroBotao(
                        texto: 'PARAR',
                        icone: Icons.stop,
                        click: store.parar,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CronometroBotao(
                      texto: 'REINICIAR',
                      icone: Icons.refresh,
                      click: store.reiniciar,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
