import 'package:api_sample/controller/homescreencontroller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool isLoading = false;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    isLoading = true;
    await Provider.of<HomeController>(context, listen: false).apiGetData();
    setState(() {});
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    final providerObj = Provider.of<HomeController>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // // data showing using key name
            // Text(providerObj.myData?["page"].toString() ?? ""),

            // // data showing after converting into model
            // Text(providerObj.restModel?.data?[1].email ?? ""),
            // Text(providerObj.restModel?.page.toString() ?? ""),
            // isLoading == true
            //     ? CircularProgressIndicator()
            Column(
              children: List.generate(
                  providerObj.restModel?.data?.length ?? 0,
                  (index) => Row(
                        children: [
                          // data[0].avatar
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                                providerObj.restModel?.data?[index].avatar ??
                                    ""),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(providerObj
                                      .restModel?.data?[index].firstName ??
                                  ""),
                              SizedBox(
                                height: 5,
                              ),
                              Text(providerObj.restModel?.data?[index].email ??
                                  "")
                            ],
                          )
                        ],
                      )),
            )

            // Column(
            //   children: List.generate(
            //       providerObj.lstStudent!.length,
            //       (index) => Column(
            //             children: [
            //               Text(providerObj.lstStudent?[index].name.toString() ??
            //                   ""),
            //               Text(providerObj.lstStudent?[index].age.toString() ??
            //                   ""),
            //               Text(providerObj.lstStudent?[index].batch ?? ""),
            //               Text(providerObj.lstStudent?[index].phone ?? ""),
            //             ],
            //           )),
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
