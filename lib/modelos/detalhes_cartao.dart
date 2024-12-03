import 'package:flutter/material.dart';

// Enum para os tipos de cartão
enum Cards {
  visa,
  mastercard,
  amex,
  discover,
}

// Extensão para obter a imagem do tipo de cartão
extension BandeirasCards on Cards {
  AssetImage get image {
    switch (this) {
      case Cards.mastercard:
        return const AssetImage("assets/imagens/cartoes_logos/mastercard.png");
      case Cards.visa:
        return const AssetImage("assets/imagens/cartoes_logos/visa.png");
      case Cards.discover:
        return const AssetImage("assets/imagens/cartoes_logos/discover.png");
      case Cards.amex:
        return const AssetImage("assets/imagens/cartoes_logos/amex.png");
      default:
        return const AssetImage("assets/imagens/cartoes_logos/default.png");
    }
  }
}

// Classe de detalhes do cartão
class DetalhesCartao {
  final String numeroCartao;
  final double saldo;
  final Cards tipoCartao; // Adicionando a propriedade para o tipo de cartão

  DetalhesCartao({
    required this.numeroCartao,
    required this.saldo,
    required this.tipoCartao,
  });
}
