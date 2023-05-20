

import 'package:get/get.dart';
import 'package:sportperson/Model/model.dart';

class SportsController extends GetxController{


  RxBool isLoading = false.obs;

  List<SportsModel> sportsData = [];

  SportsController(){
    getSportsData();
  }

  void getSportsData() {
    isLoading.value = true;
    sportsData = [
      SportsModel(heading: "Running Time", totalTime : 200,sunTime: 20, monTime: 30, tuesTime: 35, wedTime: 40, thuTime: 45, friTime: 30, satTime: 25),
      SportsModel(heading: "Jogging Time", totalTime:220,sunTime: 25, monTime: 35, tuesTime: 40, wedTime: 45, thuTime: 50, friTime: 25, satTime: 40),
      SportsModel(heading: "Exercise Time", totalTime:295,sunTime: 30, monTime: 35, tuesTime: 40, wedTime: 45, thuTime: 50, friTime: 55, satTime: 40),
      SportsModel(heading: "Total Time\n(Running+\nJogging+\nExercise)", totalTime:420,sunTime: 75, monTime: 100, tuesTime: 115, wedTime: 130, thuTime: 145, friTime: 110, satTime: 105),
      SportsModel(heading: "RunningTime \nengagement\n %(Running \n/ Total Time))", totalTime:1.11,sunTime: 0.10, monTime: 0.15, tuesTime: 0.17, wedTime: 0.2, thuTime: 0.22, friTime: 0.15, satTime: 0.12),
      SportsModel(heading: "Jogging \nTime engagement \n%(Jogging \n/ Total Time)", totalTime:1.12,sunTime: 0.11, monTime: 0.15, tuesTime: 0.18, wedTime: 0.2, thuTime: 0.22, friTime: 0.15, satTime: 0.11),
      SportsModel(heading: "ExerciseTime \nengagement \n%(Exercise \n/ Total Time)", totalTime:0.96,sunTime: 0.10, monTime: 0.11, tuesTime: 0.13, wedTime: 0.15, thuTime: 0.16, friTime: 0.18, satTime: 0.13),




    ];
    isLoading.value = false;
  }


}