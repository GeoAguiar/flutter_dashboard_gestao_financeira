/***
 * import 'package:flutter/material.dart';
import 'package:painel_web_dashboard/widgets/secao_adiquira_versao_pro.dart';
import '../modelos/detalhes_cartao.dart';
import '../widgets/barra_navegacao_inferior.dart';
import '../widgets/grafico_receitas_despesas.dart';
import '../widgets/lista_transacoes.dart';
import '../widgets/navegacao_lateral.dart';
import '../widgets/secao_estatisticas_por_categoria.dart';
import '../widgets/topbar.dart';

class TelaDashboard extends StatelessWidget {
  TelaDashboard({super.key});

  final cartoes = [
    DetalhesCartao(
      numeroCartao: "123...5432",
      saldo: 1500.50,
      tipoCartao: Cards.visa,
    ),
    DetalhesCartao(
      numeroCartao: "987...5678",
      saldo: 3200.75,
      tipoCartao: Cards.mastercard,
    ),
  ];

  @override
  Widget build(BuildContext context) {


    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = MediaQuery.of(context).size.width >= 1150;

        return Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          appBar: CustomAppBar(isDesktop: isDesktop),
          drawer: !isDesktop ? const NavegacaoLateralDrawer(color: Colors.white) : null,
          body: isDesktop
              ? Row(
            children: [
              // Navegação lateral no desktop
              SizedBox(
                width: 190, // Largura fixa para o menu lateral
                child: const NavegacaoLateralDrawer(color: Colors.white),
              ),
              // Conteúdo principal
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(flex: 1,
                                child: SizedBox(width: 15,)),
                            const Text(
                              "Receitas e Despesas",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Expanded(flex: 5,
                                child: SizedBox(width: 15,)),
                            const Text(
                              "Seus Cartões",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                                child: SizedBox(width: 15,)),
                          ],
                        ),
                        // Linha para o gráfico e os cartões
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex:4,
                                child: GraficoReceitasDespesas(isDesktop: isDesktop)),
                            const SizedBox(width: 16),
                            Expanded(
                              child: SizedBox(
                                width:  MediaQuery.sizeOf(context).width * 0.1,
                                child: Container(
                                  height: 280,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      const SizedBox(height: 10),
                                      // Lista de cartões
                                      ...cartoes.map((cartao) {
                                        return Card(
                                          child: SizedBox(
                                            child: ListTile(
                                              leading: Image(image: cartao.tipoCartao.image),
                                              title: Text(
                                                "Cartão: ${cartao.numeroCartao}",
                                                style: const TextStyle(fontSize: 14),
                                              ),
                                              subtitle: Text(
                                                "Saldo: R\$ ${cartao.saldo.toStringAsFixed(2)}",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Seção Movimentações
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           SizedBox(
                             width: MediaQuery.of(context).size.width * 0.70,
                             child: Column(

                               children: [
                                 const SizedBox(child: SecaoUpgradePro(), height: 150, width: double.maxFinite,),
                                 const SizedBox(height: 20),
                                 const Text(
                                   "Movimentações Recentes: Última atualização: hoje às 14:30",
                                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                 ),
                                 const SizedBox(height: 16),

                                 SizedBox( width:   double.maxFinite,
                                   height: MediaQuery.sizeOf(context).height * 0.3, // Altura fixa para o ListView
                                   child: Container(
                                       decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(12.0),
                                     color: Colors.white,
                                   ),
                                       child: ListaTransacoes()),
                                 ),
                               ],),
                           ),
                           SizedBox(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 StatisticsSection(isDesktop: isDesktop),
                        ],),
                           ),
                         ],
                       ),
                        const SizedBox(height: 20), // Espaçamento entre seções
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
              : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    "Receitas e Despesas",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  GraficoReceitasDespesas(isDesktop: isDesktop),
                  const SizedBox(height: 20),
                  const Text(
                    "Seus Cartões",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      // Lista de cartões
                      ...cartoes.map((cartao) {
                        return Card(
                          child: SizedBox(
                            child: ListTile(
                              leading: Image(image: cartao.tipoCartao.image),
                              title: Text(
                                "Cartão: ${cartao.numeroCartao}",
                                style: const TextStyle(fontSize: 14),
                              ),
                              subtitle: Text(
                                "Saldo: R\$ ${cartao.saldo.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                  const SizedBox(child: SecaoUpgradePro(),
                      height: 150),
                  const SizedBox(height: 20),
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        StatisticsSection(isDesktop: isDesktop),
                      ],),
                  ),
                  // Seção Movimentações
                  const Text(
                    "Movimentações Recentes: Última atualização: hoje às 14:30",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 300, // Altura fixa para o ListView
                    child: const ListaTransacoes(),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: !isDesktop ? const BarraNavegacaoInferior() : null,
        );
      },
    );
  }
}
***/