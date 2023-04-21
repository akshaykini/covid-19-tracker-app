import 'package:covid19_tracker/widget/homepage_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CountryDetailsScreen extends StatefulWidget {
  String countryname, image;
  int totalcases,
      totaldeaths,
      totalrecovered,
      active,
      critical,
      todayrecovered,
      test;

  CountryDetailsScreen(
      {super.key,
      required this.countryname,
      required this.image,
      required this.totalcases,
      required this.totaldeaths,
      required this.totalrecovered,
      required this.active,
      required this.critical,
      required this.todayrecovered,
      required this.test});

  @override
  State<CountryDetailsScreen> createState() => _CountryDetailsScreenState();
}

class _CountryDetailsScreenState extends State<CountryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.countryname),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .068),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * .06,),
                      RowWidget(data1: 'Cases', data2: widget.totalcases.toString()),
                      RowWidget(data1: 'Deaths', data2: widget.totaldeaths.toString()),
                      RowWidget(data1: 'Total Recovered', data2: widget.totalrecovered.toString()),
                      RowWidget(data1: 'Active', data2: widget.active.toString()),
                      RowWidget(data1: 'Critical', data2: widget.critical.toString()),
                      RowWidget(data1: 'Today Recovered', data2: widget.todayrecovered.toString()),
                    ],
                  ),
                ),
              ),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(widget.image),
            )
            ],
          )
        ],
      ),
    );
  }
}
