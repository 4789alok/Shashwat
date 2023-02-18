import 'package:flutter/material.dart';
import 'package:shashwat/Screen/Result/onechapter_result.dart';
import 'package:shashwat/Screen/Result/youranswer.dart';

class OverView extends StatefulWidget {
  const OverView({super.key});

  @override
  State<OverView> createState() => _OverViewState();
}

class _OverViewState extends State<OverView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF033d73),
        title: const Text("Result"),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 1,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("./images/backin.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.only(bottom: 14, top: 14, left: 29, right: 20),
                //  color: Colors.grey.shade200,
                decoration: const BoxDecoration(
                    //   color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                // padding: const EdgeInsets.all(10),
                child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: const Color(0xFF033d73),

                    //  labelStyle: TextStyle(fontSize: 20),
                    //    unselectedLabelStyle: Colors.grey,
                    labelColor: Colors.white,
                    //  indicatorPadding: EdgeInsets.all(20),
                    //   labelPadding: const EdgeInsets.only(left: 30, right: 30),
                    controller: _tabController,
                    indicator: BoxDecoration(
                      color: const Color(0xFF033d73),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // padding: const EdgeInsets.all(20),
                    tabs: const [
                      Tab(text: "Your Performance"),
                      Tab(text: "Your Answers"),
                    ]),
              ),
              Expanded(
                child: Container(
                  // height: 500,
                  color: Colors.transparent,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
                        OneChapter_Result(),
                        YourAnswer(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
