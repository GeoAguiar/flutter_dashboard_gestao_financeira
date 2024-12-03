import 'package:flutter/material.dart';

import '../estilos/estilos.dart';

class SecaoUpgradePro extends StatelessWidget {
  const SecaoUpgradePro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Estilos.corPadraoAmarela,
        borderRadius: Estilos.bordaArredondadaPadrao,
      ),
      padding: EdgeInsets.symmetric(horizontal: Estilos.paddingPadrao),
      child: Row(
        mainAxisSize: MainAxisSize.min,  // Garante que o Row ocupe apenas o espaço necessário
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      children: [
                        const TextSpan(
                          text: "Atualize sua conta para ",
                        ),
                        TextSpan(
                          text: "PRO+",
                          style: TextStyle(
                            color: Estilos.corPadraoVermelha,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        children: [
                          const TextSpan(text: "Com uma conta "),
                          TextSpan(
                            text: "PRO+ ",
                            style: TextStyle(
                              color: Estilos.corPadraoVermelha,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(
                            text:
                            "você tem muitos recursos adicionais e convenientes para controlar suas finanças.",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset("assets/imagens/astranaut.png"),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                height: 50,
                width: 50,
                child: IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
