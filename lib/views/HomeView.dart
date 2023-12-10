import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/HomeController.dart';
import '../routes/app_pages.dart';
import '../utils/consts.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        initState: (_) {},
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("نظام المخالفات التجارية"),
              actions: [
                IconButton(
                    onPressed: () {
                      _.logout();
                    },
                    icon: const Icon(Icons.logout))
              ],
              // centerTitle: true,
            ),
            body: RefreshIndicator(
              backgroundColor: Const.primaryLightColor,
              onRefresh: () => Future.delayed(const Duration(milliseconds: 500), () => true),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    GridView.count(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      primary: false,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
                      children: [
                        Card(
                          elevation: 2,
                          margin: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.QR_SCANNER);
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.qr_code_scanner,
                                        size: 60,
                                        color: Const.primaryColor,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "ماسح باركود",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Const.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 2,
                          margin: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.SPECIMEN_SEARCH);
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.search,
                                        size: 60,
                                        color: Const.primaryColor,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "استعلام عن مخالفة",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Const.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 2,
                          margin: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.SPECIMENS, arguments: true);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.list,
                                        size: 60,
                                        color: Const.primaryColor,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "مخالفاتي",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Const.primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
