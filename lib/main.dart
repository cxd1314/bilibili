import 'package:flutter/material.dart';
import 'ChannelWidget.dart';
import 'home_zhhuibo_page.dart';

void main() => runApp(MyApp());
//git test
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  
  TabController _tabController;
  var _currentIndex = 0;

  @override
  void initState () {
    super.initState();
    _tabController = new TabController(vsync: this, length: 4, initialIndex: 0);
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    var appbodys = [
      HomeZhuiFanWidget(),
      Text("data"),
      Text("data"),
      HomeZhuiFanWidget(),
    ];
    var style =TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500);
    var bottoms = [
      TabBar(tabs: <Widget>[
        new Container(
          child: Tab(
            icon: Text('直播',style: style,),
          ),
        ),
        new Container(
          child: Tab(
            icon: Text('推荐',style: style,),
          ),
        ),
        new Container(
          child: Tab(
            icon: Text('热门',style: style,),
          ),
        ),
        new Container(
          child: Tab(
            icon: Text('追番',style: style,),
          ),
        ),
      ],
      controller: _tabController,
      ),
      null,
      null,
      null,
      null
    ];
    var bodys = [
      TabBarView(
        children: appbodys,
        controller: _tabController,
      ),
      
    ];
    return Scaffold(
      appBar: _currentIndex==4?null:AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        bottom: bottoms[_currentIndex],
      ),
      body: bodys[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFFeb7b98),
        unselectedItemColor: Color(0xFFa6a6a6),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.audiotrack),title: Text("频道")),
          BottomNavigationBarItem(icon: Icon(Icons.cloud),title: Text("动态")),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),title: Text("会员购")),
          BottomNavigationBarItem(icon: Icon(Icons.person),title: Text("我的")),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
