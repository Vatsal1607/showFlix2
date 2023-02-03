import 'package:flutter/material.dart';

import 'package:update_showflix/description.dart';

class TV extends StatelessWidget {
  final List? tv;
  const TV
      ({Key? key,this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tv Show" ,style: TextStyle(fontSize:
          20,fontWeight: FontWeight.bold)),
          SizedBox(height: 10,),
          Container(height: 200,
            child: ListView.builder(
                itemCount: tv?.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                          name: tv?[index]['original_name'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500'+tv?[index]['backdrop_path'],
                          posterurl: 'https://image.tmdb.org/t/p/w500'+tv?[index]['poster_path'],
                          description: tv?[index]['overview'],
                          vote: tv?[index]['vote_average'].toString(),
                          luanch_on: '1-23-2022',

                        )));
                      },
                      child:
                      tv?[index]['original_name'] !=null?Container(

                        padding: EdgeInsets.all(5),
                        width: 250,
                        child: Column(children: [
                          Container(

                            height:140,
                            width: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500'+tv?[index]['backdrop_path']
                                    ),
                                    fit: BoxFit.cover
                                )),),

                          SizedBox(height: 10,),
                          Container(child: Text(( tv?[index]['original_name'])!=null?
                          (  tv?[index]['original_name']):'loding'),)


                        ],),):Container(child: Text('not lod'),)
                  );
                }
            ),)
        ],
      ),
    );
  }
}

