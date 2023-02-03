import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:update_showflix/drawer.dart';
import 'package:update_showflix/screen/login.dart';
import 'package:update_showflix/widget/trending.dart';
import 'package:update_showflix/widget/toprated.dart';
import 'package:update_showflix/widget/tv.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trandingmovies =[];
  List topratedmovies=[];
  List tv=[];
  final String apikey='833c32a65d2d0eb1631f0481056e44f7';
  final readaccesstoken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MzNjMzJhNjVkMmQwZWIxNjMxZjA0ODEwNTZlNDRmNyIsInN1YiI6IjYzNzVkNTc5MTFjMDY2MDA3YjEyN2M2NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.aF4s86E0E86LJ-uqdxhV_HDlqCL9Ic9vFhhsEIXTJn8';

  void initState(){
    loadmovies();
    super.initState();

  }

  loadmovies()async{
    TMDB tmdbWithCostomLogs=TMDB(ApiKeys(apikey,readaccesstoken),
        logConfig:ConfigLogger(
          showLogs:true,
          showErrorLogs: true,
        ));
    Map trandingResult=await tmdbWithCostomLogs.v3.trending.getTrending();
    Map topratedresult=await tmdbWithCostomLogs.v3.movies.getTopRated();
    Map tvresult=await tmdbWithCostomLogs.v3.tv.getPopular();
    print(tvresult);
    setState(() {
      trandingmovies=trandingResult['results'];
      topratedmovies=topratedresult['results'];
      tv=tvresult['results'];
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Show Flix"), backgroundColor: Colors.orange,
        actions: [
          IconButton(onPressed: (){
          //  Constants.prefs.setBool("loggedIn", false);
           // Navigator.pushReplacementNamed(context, "/login");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const login()),
            );
          },
              icon: const Icon(Icons.exit_to_app)
          )
        ],
      ),
      body: ListView(
        children: [
          TV(tv: tv,),
          TopRated(toprated: topratedmovies,),
          TrendingMovie(trendingmovies:trandingmovies),

        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}
