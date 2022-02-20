
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sticky_session/constants.dart';
import 'package:flutter_sticky_session/data/sticky_repository.dart';
import 'package:flutter_sticky_session/ui/session/components/sticky_list_page_view.dart';
import 'package:flutter_sticky_session/ui/session/ui_column_detail.dart';
import 'package:flutter_sticky_session/ui/sessions/ui_session_detail.dart';
import 'package:get_it/get_it.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({Key? key}) : super(key: key);
  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<UiColumnDetail> columns = List.empty();

  @override
  void initState() {
    GetIt.I<StickyRepository>().getStickiesByColumns().listen((result) {
      setState(() {
        columns = result;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UiSessionDetail? sessionDetail = ModalRoute.of(context)?.settings.arguments as UiSessionDetail?;

    if (columns.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        )
      );
    }
    _tabController ??= TabController(length: columns.length, vsync: this);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          sessionDetail?.name ?? "Test",
          style: const TextStyle(
              color: primaryColor,
              fontSize: 24
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: primaryColor,)
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark
        ),
        bottom: TabBar(
            controller: _tabController,
            tabs: columns.map((column) => Tab(
              child: Text("${column.name} (${column.stickies.length})"),
            )).toList(),
            labelColor: const Color(0xFF57BE7F),
            labelPadding: const EdgeInsets.symmetric(horizontal: 21),
            labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            unselectedLabelColor: Colors.grey.shade700,
            indicatorColor: const Color(0xFF57BE7F),
            isScrollable: true,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: columns.map((column) => StickyListPageView(
          columnDetail: column
        )).toList()
      )
    );
  }
}

