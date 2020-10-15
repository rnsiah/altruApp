import 'package:altru/Widgets/ShirtShowcase.dart';
import 'package:flutter/material.dart';
import 'package:altru/API.dart';
import 'package:altru/Widgets/NonProfit_Details.dart';
import 'package:altru/Widgets/AtrocityShowcase.dart';
import 'package:altru/Widgets/VolunteerOppShowcase.dart';


class NonProfitDetailTabs extends StatefulWidget {
  final NonProfit nonProfit;
  final Widget widget;
  NonProfitDetailTabs({Key key, this.nonProfit, this.widget }): super(key:key);

  @override
  _NonProfitDetailTabsState createState() => _NonProfitDetailTabsState();
}

class _NonProfitDetailTabsState extends State<NonProfitDetailTabs>
    with TickerProviderStateMixin {
  List<Tab> _tabs;
  List<Widget>_pages;
  TabController _controller;

  @override void initState() {
    // TODO: implement initState
    super.initState();
    _tabs = [
      new Tab(text: 'Shirts'),
      new Tab(text: 'Atrocities'),
      new Tab(text: 'Volunteer Opportunities')
    ];
    _pages = [
      new NonProfitShirtShowcase(nonProfit: widget.nonProfit,),
      new NonProfitAtrocityShowcase(nonProfit: widget.nonProfit,),
      new NonProfitVolunteerShowcase(nonProfit: widget.nonProfit,),
    ];
    _controller= new TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Column(
        children: [
          Container(
            color: Colors.black,
            child: TabBar(
              controller: _controller,
              tabs: _tabs,
              indicatorColor: Colors.amber,
              unselectedLabelColor: Colors.white,
            ),
          ),
          SizedBox.fromSize(
            size: Size.fromHeight(300.0),
            child: TabBarView(
              controller: _controller,
              children: _pages,
            ),
          )
        ],
      ),
    );
  }
}
