import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../estilos/estilos.dart';

class TelaEstatisticas extends StatelessWidget {
  const TelaEstatisticas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Estatísticas"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            const SizedBox(height: 20),
            _buildPromotionalCard(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCardsOverview(),
                _buildPieChart(),
              ],
            ),
            const SizedBox(height: 20),
            _buildTransactionList(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticCard({required String title, required String value, required Color color, required Widget chart}) {
    return Expanded(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.grey[700], fontSize: 16)),
              const SizedBox(height: 10),
              Text(value, style: TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              SizedBox(height: 60, child: chart),
            ],
          ),
        ),
      ),
    );
  }

  LinearGradient get _barsGradient => LinearGradient(
    colors: [
      Estilos.corPadraoVermelha,
      Estilos.corPadraoAzul,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );



  Widget _buildPromotionalCard() {
    return Card(
      color: Colors.amber,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Expanded(
              child: Text(
                "Atualize sua conta para o PRO+ e obtenha mais recursos!",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ),
            Icon(Icons.arrow_forward, color: Colors.black87),
          ],
        ),
      ),
    );
  }

  Widget _buildCardsOverview() {
    return Expanded(
      child: Column(
        children: [
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.credit_card, color: Colors.orange),
              title: const Text("**** 5689"),
              subtitle: const Text("MasterCard"),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.credit_card, color: Colors.blue),
              title: const Text("**** 3424"),
              subtitle: const Text("Visa"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPieChart() {
    return Expanded(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text("Por Categoria", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              SizedBox(
                height: 120,
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(value: 50, color: Colors.redAccent, title: "50%"),
                      PieChartSectionData(value: 35, color: Colors.blueAccent, title: "35%"),
                      PieChartSectionData(value: 15, color: Colors.greenAccent, title: "15%"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionList() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 4,
      child: Column(
        children: [
          ListTile(
            title: const Text("Spotify"),
            subtitle: const Text("ID: 45673 | Dec 29, 2:35 PM"),
            trailing: Text("- R\$ 569,50", style: TextStyle(color: Colors.redAccent)),
          ),
          const Divider(),
          ListTile(
            title: const Text("Transferência"),
            subtitle: const Text("ID: 76154 | Dec 28, 1:20 PM"),
            trailing: Text("+ R\$ 350,50", style: TextStyle(color: Colors.greenAccent)),
          ),
          const Divider(),
          ListTile(
            title: const Text("Investimentos"),
            subtitle: const Text("ID: 32567 | Dec 27, 4:55 PM"),
            trailing: Text("+ R\$ 3.448,99", style: TextStyle(color: Colors.greenAccent)),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: TelaEstatisticas()));
}
