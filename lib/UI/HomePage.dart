import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sportperson/controller/sports_controller.dart';

class HomePagedetails extends StatefulWidget {
  const HomePagedetails({Key? key}) : super(key: key);

  @override
  _HomePagedetailsState createState() => _HomePagedetailsState();
}

class _HomePagedetailsState extends State<HomePagedetails> {
  var size;

  @override
  void initState() {
    super.initState();
    intializeData();
  }

  final sportsController = Get.put(SportsController());

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Obx(() =>
                sportsController.isLoading.value?
                Center(
                  child: CircularProgressIndicator(),
                ):sportsController.sportsData.length>0?
                Theme(data: Theme.of(context).copyWith(
                    dividerColor: Colors.green,

                ),
                    child: DataTable2(
                      border: TableBorder.all(
                        color: Colors.black,
                        width: 2,
                      ),
                        //dividerThickness: 3,
                        columnSpacing: 10,
                        horizontalMargin: 10,
                        minWidth: 900,
                        dataRowHeight: 100,
                        fixedColumnsColor: Colors.orange.withOpacity(0.4),
                        fixedLeftColumns: 1,
                        fixedTopRows: 1,
                        headingRowHeight: 100,
                        headingRowColor: MaterialStateProperty.all(Colors.orange.withOpacity(0.4),),
                        columns: const [
                          DataColumn2(
                            label: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 20,),
                                Center(child: Text('Total Info \nfor the WEEK')),
                                SizedBox(height: 10,),
                                Text('')
                              ],
                            ),

                            size: ColumnSize.L,
                          ),
                          DataColumn(
                            label: Column(
                              children: [
                                SizedBox(height: 20,),
                                Center(child: Text('Total\n(Sun-Sat)')),
                                SizedBox(height: 10,),
                                Text('')
                              ],
                            ),

                          ),
                          DataColumn(
                            label: Column(
                              children: [
                                SizedBox(height: 20,),
                                Text('Sun'),
                                SizedBox(height: 30,),
                                Center(child: Text('14-05-2023'))
                              ],
                            ),

                          ),
                          DataColumn(
                            label: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 20,),
                                Text('Mon'),
                                SizedBox(height: 30,),
                                Center(child: Text('15-05-2023'))
                              ],
                            ),


                          ),
                          DataColumn(
                            label: Column(
                              children: [
                                SizedBox(height: 20,),
                                Text('Tue'),
                                SizedBox(height: 30,),
                                Center(child: Text('16-05-2023'))
                              ],
                            ),

                          ),
                          DataColumn(
                            label: Column(
                              children: [
                                SizedBox(height: 20,),
                                Text('Wed'),
                                SizedBox(height: 30,),
                                Center(child: Text('17-05-2023'))
                              ],
                            ),


                          ),
                          DataColumn(
                            label: Column(
                              children: [
                                SizedBox(height: 20,),
                                Text('Thu'),
                                SizedBox(height: 30,),
                                Center(child: Text('18-05-2023'))
                              ],
                            ),

                          ),
                          DataColumn(
                            label: Column(
                              children: [
                                SizedBox(height: 20,),
                                Text('Fri'),
                                SizedBox(height: 30,),
                                Center(child: Text('19-05-2023'))
                              ],
                            ),

                          ),
                          DataColumn(
                            label: Column(
                              children: [
                                SizedBox(height: 20,),
                                Text('Sat'),
                                SizedBox(height: 30,),
                                Center(child: Text('20-05-2023'))
                              ],
                            ),

                          ),
                        ],
                        rows: List<DataRow>.generate(
                            sportsController.sportsData.length,
                                (index) => DataRow(
                                    color: MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          // Even rows will have a grey color.
                                          if (index % 2 == 0)
                                            return Colors.grey.withOpacity(0.1);
                                          return Colors.white; // Use default value for other states and odd rows.
                                        }),
                                cells: [
                                  DataCell(Text('${sportsController.sportsData[index].heading}')),
                                  DataCell(Text('${sportsController.sportsData[index].totalTime}')),
                                  DataCell(Text('${sportsController.sportsData[index].sunTime}')),
                                  DataCell(Text('${sportsController.sportsData[index].monTime}')),
                                  DataCell(Text('${sportsController.sportsData[index].tuesTime}')),
                                  DataCell(Text('${sportsController.sportsData[index].wedTime}')),
                                  DataCell(Text('${sportsController.sportsData[index].thuTime}')),
                                  DataCell(Text('${sportsController.sportsData[index].friTime}')),
                                  DataCell(Text('${sportsController.sportsData[index].satTime}')),
                                ]
                            )
                        )
                    )
                        ):Center(
                  child: Text("No Data Found"),
                ),
    )
    )
    ,
    );
  }

  intializeData() {
    Future.delayed(Duration.zero, () {
      showDialog(
          context: context,
          builder: (_) =>
              AlertDialog(
                title: const Text("Please Set orientation"),
                content: const Text("Change to landscape?"),
                actions: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          )
                      ),
                      onPressed: () {
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.landscapeRight,
                          DeviceOrientation.landscapeLeft,
                        ]);
                        Navigator.pop(context);
                      }, child: const Text("Ok", style: TextStyle(),)),
                  ElevatedButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: const Text("Cancel")),
                ],
              ));
    });
  }
}
