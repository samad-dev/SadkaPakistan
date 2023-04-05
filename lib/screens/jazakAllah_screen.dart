import 'package:flutter/material.dart';
import 'package:sadqapak/screens/home_screen.dart';
import 'package:sadqapak/screens/main_drawer_scree.dart';
import 'package:sadqapak/utils/routes.dart';
import 'package:sadqapak/utils/service_locator.dart';

import '../services/navigation_service.dart';
import 'my_order_detail_screen.dart';

class JazakAllahScreen extends StatefulWidget {
  const JazakAllahScreen({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  State<JazakAllahScreen> createState() => _JazakAllahScreenState(id);
}

class _JazakAllahScreenState extends State<JazakAllahScreen> {
  final String id;
  var navigationService = locator<NavigationService>();
  Color themeColor = const Color.fromRGBO(36, 124, 38, 1);

  _JazakAllahScreenState(this.id);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // toolbarHeight: 0,
        // systemOverlayStyle: const SystemUiOverlayStyle(
        //   // Status bar color
        //   statusBarColor: Colors.transparent,

        //   // Status bar brightness (optional)
        //   statusBarIconBrightness:
        //       Brightness.dark, // For Android (dark icons)
        //   statusBarBrightness: Brightness.light, // For iOS (dark icons)
        // ),
        backgroundColor: Colors.white,

        elevation: 0,
        bottomOpacity: 0,

        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  MainDrawerScreen(items: {},)),
                );
              },
              icon: Image.asset(
                "assets/images/humburger.png",
                height: height * 0.05,
              ))
        ],
        // leading: IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.arrow_back_ios,
        //       color: Colors.black,
        //       size: width * 0.04,
        //     ))
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          // Center(
          //   child: Image.asset(
          //     'assets/images/hands.png',
          //     scale: 2,
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Thank You',
            style: TextStyle(
                fontSize: 33,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(36, 124, 38, 1)),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Following is your Order Id\nfor future reference',
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: 28, color: Color.fromRGBO(6, 7, 12, 0.5)),
          ),
          const SizedBox(
            height: 35,
          ),
           GestureDetector(
             onTap: (){
               Navigator.push(
                 context,
                 new MaterialPageRoute(
                     builder:
                         (BuildContext context) =>
                         MyOrderDetailScreen(person: int.parse(id),)),
               );
             },
             child: Text(
              'Order Id:'+id.toString()+'\nclick here to view order detail',
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: 28, color: Color.fromRGBO(6, 7, 12, 0.5)),
          ),
           ),
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(
                    // width: 5.0,
                    color: Colors.white,
                  ),
                  minimumSize: Size.fromHeight(
                      MediaQuery.of(context).size.height * 0.052),
                  primary: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.02),
                  ),
                ),
                onPressed: () {
                  navigationService.navigateTo(homeScreenRoute);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.022,
                      bottom: MediaQuery.of(context).size.height * 0.022),
                  child: Text(
                    'Go To Main',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
