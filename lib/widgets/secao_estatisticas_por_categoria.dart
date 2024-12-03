import 'package:flutter/material.dart';

class StatisticsSection extends StatelessWidget {
  final isDesktop;

  StatisticsSection( {super.key, this.isDesktop});



  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double larguraCirculo = (isDesktop && screenWidth > 1545) ? 100 : 100;
    double fonteTitulo = (isDesktop && screenWidth > 1545) ? 18 : 14;
    double fonte = (isDesktop && screenWidth > 1545) ? 24 : 12;



    return isDesktop ? Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),

        child: SizedBox(
           height:450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Text(
                'Estatísticas por \n Categoria',
                style: TextStyle(fontSize: fonteTitulo, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
                    Center(
                child: Container(
                  width: (isDesktop && screenWidth > 1545) ? 100 : 50,
                  height:100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: SweepGradient(
                      colors: [Colors.blue, Colors.red, Colors.yellow],
                      stops: [0.5, 0.85, 1.0],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '100%',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ) ,
              const SizedBox(height: 16),
              Column(
                children: [
                  _buildCategoryRow(Colors.blue, 'Other expenses - 50%'),
                  _buildCategoryRow(Colors.red, 'Entertainment - 35%'),
                  _buildCategoryRow(Colors.yellow, 'Investments - 15%'),
                ],
              ),
            ],
          ),
        ),
      ),
    ) : Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),

        child: SizedBox(
          width: double.maxFinite,
          height:300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Statistics by category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Center(
                child: Container(
                  width: larguraCirculo,
                  height:150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: SweepGradient(
                      colors: [Colors.blue, Colors.red, Colors.yellow],
                      stops: [0.5, 0.85, 1.0],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '100%',
                      style: TextStyle(fontSize: fonte, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  _buildCategoryRow(Colors.blue, 'Other expenses - 50%'),
                  _buildCategoryRow(Colors.red, 'Entertainment - 35%'),
                  _buildCategoryRow(Colors.yellow, 'Investments - 15%'),
                ],
              ),
            ],
          ),
        ),
      ),
    ) ;
  }

  Widget _buildCategoryRow(Color color, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.circle, color: color, size: 12),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
