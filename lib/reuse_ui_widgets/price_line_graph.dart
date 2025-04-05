import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../model/crypto_model.dart';

class PriceLineGraph extends StatelessWidget {
  final CryptoModel crypto;

  const PriceLineGraph({super.key, required this.crypto});

  @override
  Widget build(BuildContext context) {
    final double currentPrice = crypto.currentPrice ?? 0;
    final double priceChange = crypto.priceChange24h ?? 0;
    
    final List<FlSpot> spots = List.generate(5,(index){
      double simulatedPrice = currentPrice - priceChange + (priceChange * index / 9);
      return FlSpot(index.toDouble(), simulatedPrice);
    });

    return SizedBox(
      height: 50,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              barWidth: 2,
              color: Colors.green,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: Colors.green.withOpacity(0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
