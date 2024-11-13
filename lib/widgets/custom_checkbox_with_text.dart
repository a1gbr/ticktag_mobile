import 'package:flutter/material.dart';

class CustomCheckboxWithText extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String text;
  final double maxWidth;

  CustomCheckboxWithText({
    required this.value,
    required this.onChanged,
    required this.text,
    this.maxWidth = 400, // Valor padrão para largura máxima
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: maxWidth, // Define a largura máxima
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center, // Alinhamento vertical central
          mainAxisAlignment: MainAxisAlignment.start, // Alinhamento horizontal à esquerda
          children: [
            Checkbox(value: value, onChanged: onChanged),
            Expanded( // Permite que o texto se expanda corretamente
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0), // Adiciona espaçamento entre o checkbox e o texto
                child: Text(
                  text,
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.visible, // Garante que o texto não seja cortado
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
