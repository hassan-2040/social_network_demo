import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 9,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Row(
          children: [
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.menu,
                  color: Colors.grey,
                ),
              ),
            ),
            Expanded(
              child: ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.centerRight,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Theme(
                      data: ThemeData(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                      ),
                      child: TabBar(
                        controller: _tabController,
                        isScrollable: true,
                        physics: const ClampingScrollPhysics(),
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        labelColor: Colors.black,
                        labelPadding: const EdgeInsets.all(5),
                        unselectedLabelColor: Colors.grey,
                        tabs: const [
                          Text('Stories'),
                          Text('Posts'),
                          Text('Videos'),
                          Text('Groups'),
                          Text('Notifications'),
                          Text('Another'),
                          Text('Extra'),
                          Text('Stuff'),
                          Text('Zilong'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
