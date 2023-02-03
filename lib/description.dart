import 'package:flutter/material.dart';

class Description extends StatelessWidget {

  final String? name, description, bannerurl, posterurl, vote, luanch_on;
  const Description({Key? key ,
    this.name,
    this.description,
    this.bannerurl,
    this.posterurl,
    this.vote,
    this.luanch_on}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(bannerurl!, fit: BoxFit.cover,),
                      )),
                  Positioned(
                      bottom: 10,
                      child: Text(" ⭐ Avrage Rating - "+ vote!,style: TextStyle(fontSize: 18),))

                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(padding: EdgeInsets.all(10),
              child: Text((name!)!=null ?(name!):'loding..',style: TextStyle(fontSize: 24),),),
            Container(padding: EdgeInsets.only(left: 10),
                child: Text('Releasing On - '+luanch_on! ,style: TextStyle(fontSize: 14),)
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl!),
                ),
                Flexible(
                  child: Container(
                    child: Text(description! ,style: TextStyle(fontSize: 18),),),
                ),


              ],

            )

          ],
        ),
      ),
    );
  }
}
