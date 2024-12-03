import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../estilos/estilos.dart';
import 'secao_cartoes.dart'; // Para gráficos de barras

class GraficoReceitasDespesas extends StatelessWidget {
  final isDesktop;

  final Color dark = Estilos.corPadraoAzul;
  final Color normal = Estilos.corPadraoAmarela;
  final Color light = Estilos.corPadraoVermelha;

   GraficoReceitasDespesas( {super.key, this.isDesktop});

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double largurasWidget = (isDesktop && screenWidth > 1545)
        ? MediaQuery.of(context).size.width * 0.69
        : MediaQuery.of(context).size.width * 0.60;



    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.lightBlueAccent,
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
         isDesktop ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Card(
                    child: BarChartWithTitle(
                      title: "Despesas",
                      amount: 5340,
                      barColor: Colors.blue,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                  child: Card(
                    child:  BarChartWithTitle(
                      title: "Receitas",
                      amount: 1980,
                      barColor: Colors.red,
                    ),)
              ),
            ],
          ) : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Card(
                  child: BarChartWithTitle(
                    title: "Despesas",
                    amount: 5340,
                    barColor: Colors.blue,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Card(
                  child: BarChartWithTitle(
                    title: "Receitas",
                    amount: 1988,
                    barColor: Colors.red,
                  ),
                ),
              ),


            ],
          ),



        ],
      ),
    );
  }
}

class BarChartWithTitle extends StatelessWidget {
  final String title;
  final Color barColor;
  final double amount;

  const BarChartWithTitle({
    Key? key,
    required this.title,
    required this.amount,
    required this.barColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(Icons.more_vert),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            children: <Widget>[
              Text(
                '\$${amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Nesta semana',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 38),
      Container(
        height: 100, // Tamanho do gráfico
        child: BarChart(
          BarChartData(
            barTouchData: BarTouchData(
            ),
            titlesData: FlTitlesData(
              show: true,
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (context, value) {
                    final style = TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    );
                    String text;
                    switch (value) {
                      case 0:
                        text = 'Seg';
                        break;
                      case 1:
                        text = 'Ter';
                        break;
                      case 2:
                        text = 'Qua';
                        break;
                      case 3:
                        text = 'Qui';
                        break;
                      case 4:
                        text = 'Sex';
                        break;
                      case 5:
                        text = 'Sáb';
                        break;
                      case 6:
                        text = 'Dom';
                        break;
                      default:
                        text = '';
                        break;
                    }
                    return Text(text, style: style);
                  },
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            barGroups: [
              BarChartGroupData(x: 0, barRods: [
                BarChartRodData(toY: 8, color: barColor, width: 25)
              ]),
              BarChartGroupData(x: 1, barRods: [
                BarChartRodData(toY: 6, color: barColor, width: 25)
              ]),
              BarChartGroupData(x: 2, barRods: [
                BarChartRodData(toY: 4, color: barColor, width: 25)
              ]),
              BarChartGroupData(x: 3, barRods: [
                BarChartRodData(toY: 7, color: barColor, width: 25)
              ]),
              BarChartGroupData(x: 4, barRods: [
                BarChartRodData(toY: 6, color: barColor, width: 25)
              ]),
              BarChartGroupData(x: 5, barRods: [
                BarChartRodData(toY: 5, color: barColor, width: 25)
              ]),
              BarChartGroupData(x: 6, barRods: [
                BarChartRodData(toY: 7, color: barColor, width: 25)
              ]),
            ],
            gridData: FlGridData(show:false),
          ),
        ),
      )
        ],
      ),
    );
  }
}
