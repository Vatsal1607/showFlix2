import 'package:update_showflix/description.dart';
import 'package:flutter/material.dart';

class TrendingMovie extends StatelessWidget {
  final List? trendingmovies;
  const TrendingMovie
      ({Key? key,this.trendingmovies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Trending Movies",style: TextStyle(fontSize:
          20,fontWeight: FontWeight.bold)),
          SizedBox(height: 10,),
          Container(height: 270,
            child: ListView.builder(
                itemCount: trendingmovies?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                        name: trendingmovies?[index]['title'],
                        bannerurl: 'https://image.tmdb.org/t/p/w500'+trendingmovies?[index]['backdrop_path'],
                        posterurl: 'https://image.tmdb.org/t/p/w500'+trendingmovies?[index]['poster_path'],
                        description: trendingmovies?[index]['overview'],
                        vote: trendingmovies?[index]['vote_average'].toString(),
                        luanch_on: trendingmovies?[index]['release_date'],

                      )));
                    },
                    child:
                    trendingmovies?[index]['title'] !=null?
                    Container(width: 140,
                      child: Column(children: [
                        Container(
                          height:200,
                          decoration: BoxDecoration(image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500'+trendingmovies?[index]['poster_path']
                            ),
                          )),),
                        Container(child: Text(( trendingmovies?[index]['title'])!=null?
                        (  trendingmovies?[index]['title']):'loding'),)


                      ],),):Container(),
                  );
                }
            ),)
        ],
      ),
    );
  }
}

