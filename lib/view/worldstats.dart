import 'package:covid19_tracker/Model/stats_model.dart';
import 'package:covid19_tracker/Services/stats_services.dart';
import 'package:covid19_tracker/view/countrieslist_screen.dart';
import 'package:covid19_tracker/widget/homepage_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatsScreen extends StatefulWidget {
  const WorldStatsScreen({super.key});

  @override
  State<WorldStatsScreen> createState() => _WorldStatsScreenState();
}

class _WorldStatsScreenState extends State<WorldStatsScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller =
      AnimationController(duration: Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .01,
            ),
            FutureBuilder(
              future: statesServices.fetchstatsrecord(),
              builder: (context, AsyncSnapshot<StatsModel> snapshot) {
                if (!snapshot.hasData) {
                  return Expanded(
                      child: SpinKitFadingCircle(
                    controller: _controller,
                    size: 50.0,
                    color: Colors.black,
                  ));
                } else {
                  return Column(
                    
                    children: [
                      PieChart(
                        
                        dataMap:  {
                          "Total": double.parse(snapshot.data!.cases.toString()),
                          "Recovered": double.parse(snapshot.data!.recovered.toString()),
                          "Death": double.parse(snapshot.data!.deaths.toString()),
                        },
                        chartValuesOptions: ChartValuesOptions(
                          showChartValuesInPercentage: true
                        ),
                        chartRadius: MediaQuery.of(context).size.height / 3.5,
                        legendOptions:
                            LegendOptions(legendPosition: LegendPosition.left),
                        chartType: ChartType.ring,
                        animationDuration: const Duration(milliseconds: 1200),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height * .03),
                        child: Card(
                          
                          child: Column(
                            
                            children: [
                              
                              RowWidget(data1: 'Total', data2: snapshot.data!.cases.toString()),
                              RowWidget(data1: 'Deaths', data2: snapshot.data!.deaths.toString()),
                              RowWidget(data1: 'Recovered', data2: snapshot.data!.recovered.toString()),
                              RowWidget(data1: 'Active', data2: snapshot.data!.active.toString()),
                              RowWidget(data1: 'Critical', data2: snapshot.data!.critical.toString()),
                              RowWidget(data1: 'Today Deaths', data2: snapshot.data!.todayDeaths.toString()),
                              RowWidget(data1: 'Today Recovered', data2: snapshot.data!.todayRecovered.toString()),
                              
                            ],
                          ),
                        ),

                        
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const CountriesListScreen(),));
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text('Track Countries'),
                          ),
                        ),
                      ),
                      
                    ],
                  );

                  
                }
              },
            )
          ],
        ),
      )),
    );
  }
}
