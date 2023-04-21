import 'package:covid19_tracker/Services/stats_services.dart';
import 'package:covid19_tracker/view/country_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: searchcontroller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 50),
                  hintText: 'Search by country name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
            Expanded(
                child: FutureBuilder(
              future: statesServices.countrieslistapi(),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (!snapshot.hasData) {
                  return ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade700,
                        highlightColor: Colors.grey.shade700,
                        child: Column(
                          children: [
                            ListTile(
                              title: Container(
                                height: 10,
                                width: 90,
                                color: Colors.grey,
                              ),
                              subtitle: Container(
                                height: 10,
                                width: 90,
                                color: Colors.grey,
                              ),
                              leading: Container(
                                height: 10,
                                width: 90,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      String countryname = snapshot.data![index]['country'];

                      if (searchcontroller.text.isEmpty) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                           CountryDetailsScreen(
                                            countryname: snapshot.data![index]['country'],
                                            image: snapshot. data! [index]['countryInfo']['flag'],
                                            totalcases: snapshot. data! [index]['cases'],
                                            totaldeaths: snapshot. data! [index]['deaths'],
                                            totalrecovered: snapshot. data! [index]['recovered'] ,
                                            active: snapshot. data! [index]['active'],
                                            critical: snapshot. data! [index]['critical'],
                                            todayrecovered: snapshot.data! [index]['todayRecovered'],
                                            test: snapshot. data! [index]['tests']

                                          ),
                                    ));
                              },
                              child: ListTile(
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(snapshot.data![index]['country']
                                    .toString()),
                                leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']['flag'])),
                              ),
                            ),
                          ],
                        );
                      } else if (countryname
                          .toLowerCase()
                          .contains(searchcontroller.text.toLowerCase())) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                           CountryDetailsScreen(
                                            countryname: snapshot.data![index]['country'],
                                            image: snapshot. data! [index]['countryInfo']['flag'],
                                            totalcases: snapshot. data! [index]['cases'],
                                            totaldeaths: snapshot. data! [index]['deaths'],
                                            totalrecovered: snapshot. data! [index]['recovered'] ,
                                            active: snapshot. data! [index]['active'],
                                            critical: snapshot. data! [index]['critical'],
                                            todayrecovered: snapshot.data! [index]['todayRecovered'],
                                            test: snapshot. data! [index]['tests']

                                          ),
                                    ));
                              },
                              child: ListTile(
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(
                                    snapshot.data![index]['country'].toString()),
                                leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']['flag'])),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }

                      return Column(
                        children: [
                          ListTile(
                            title: Text(snapshot.data![index]['country']),
                            subtitle: Text(
                                snapshot.data![index]['country'].toString()),
                            leading: Image(
                                height: 50,
                                width: 50,
                                image: NetworkImage(snapshot.data![index]
                                    ['countryInfo']['flag'])),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
