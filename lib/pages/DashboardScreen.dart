import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color primaryBlue = Color(0xFF1976D2);
    final Color accentBlue = Color(0xFF64B5F6);
    final Color cardBg = Colors.white;
    final Color bg = Colors.grey[50]!;

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        title: Text('Dashboard', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: primaryBlue,
        elevation: 2,
      ),
      body: ListView(
        padding: EdgeInsets.all(18),
        children: [
          // Latest Order Section
          Card(
            color: cardBg,
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Latest Order', style: TextStyle(fontWeight: FontWeight.bold, color: primaryBlue)),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order #2051BW', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                            SizedBox(height: 2),
                            Text('Restaurant Location', style: TextStyle(color: Colors.grey[700])),
                            Text('Shop: Hotel Street, New York, New York', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: accentBlue.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text('COD', style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: primaryBlue),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text('Details', style: TextStyle(color: primaryBlue)),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryBlue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text('Direction', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 18),
          // Earnings Section
          Card(
            color: accentBlue.withOpacity(0.12),
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.account_balance_wallet, color: primaryBlue, size: 36),
                      SizedBox(width: 12),
                      Text('₹70.55', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: primaryBlue)),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Today: ₹30.55', style: TextStyle(color: Colors.grey[700])),
                          Text('This week: ₹130.55', style: TextStyle(color: Colors.grey[700])),
                          Text('This month: ₹300.55', style: TextStyle(color: Colors.grey[700])),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 18),
          // Order Stats Section
          Row(
            children: [
              _dashboardStatCard('55', 'Todays Orders', primaryBlue),
              SizedBox(width: 12),
              _dashboardStatCard('05', 'This Week Orders', accentBlue),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              _dashboardStatCard('35', 'Total Orders', Colors.blueGrey),
              SizedBox(width: 12),
              _dashboardStatCard('₹75', 'Cash In Hand', Colors.teal),
            ],
          ),
          SizedBox(height: 24),
          // Sales Chart Section
          Text('Sales Overview', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: primaryBlue)),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: cardBg,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
            ),
            child: SizedBox(
              height: 250,
              child: SalesChartWidget(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dashboardStatCard(String value, String label, Color color) {
    return Expanded(
      child: Card(
        color: color.withOpacity(0.12),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8),
          child: Column(
            children: [
              Text(value, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: color)),
              SizedBox(height: 4),
              Text(label, style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w500, fontSize: 13)),
            ],
          ),
        ),
      ),
    );
  }
}

// Sales Chart Widget using fl_chart
class SalesChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final monthlySales = [11000, 9500, 8700, 11200, 11900, 8200, 12200, 12500, 10000, 8100, 13000, 7600];
    final weeklySales = [1500, 3000, 3000, 4500];
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

    return Column(
      children: [
        // Monthly Sales Bar Chart
        SizedBox(
          height: 120,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 14000,
              barTouchData: BarTouchData(enabled: false),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 28)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      int idx = value.toInt();
                      return idx >= 0 && idx < months.length
                          ? Text(months[idx], style: TextStyle(fontSize: 10))
                          : Text('');
                    },
                  ),
                ),
                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(show: false),
              barGroups: List.generate(monthlySales.length, (i) {
                return BarChartGroupData(
                  x: i,
                  barRods: [
                    BarChartRodData(
                      toY: monthlySales[i].toDouble(),
                      color: Color(0xFF1976D2),
                      width: 12,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                );
              }),
              gridData: FlGridData(show: true, horizontalInterval: 2000, getDrawingHorizontalLine: (value) {
                return FlLine(color: Colors.grey[300], strokeWidth: 1);
              }),
            ),
          ),
        ),
        SizedBox(height: 14),
        // Weekly Sales Line Chart
        SizedBox(
          height: 80,
          child: LineChart(
            LineChartData(
              minY: 0,
              maxY: 5000,
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 28)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      const weeks = ['W1', 'W2', 'W3', 'W4'];
                      int idx = value.toInt();
                      return idx >= 0 && idx < weeks.length
                          ? Text(weeks[idx], style: TextStyle(fontSize: 10))
                          : Text('');
                    },
                  ),
                ),
                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              gridData: FlGridData(show: true, horizontalInterval: 1000, getDrawingHorizontalLine: (value) {
                return FlLine(color: Colors.grey[300], strokeWidth: 1);
              }),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: List.generate(weeklySales.length, (i) => FlSpot(i.toDouble(), weeklySales[i].toDouble())),
                  isCurved: true,
                  color: Color(0xFF1976D2),
                  barWidth: 3,
                  dotData: FlDotData(show: true),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
