import 'package:flutter/material.dart';
import 'DetailsPage.dart';
class Announce {
  String title;
  String description;
  double neededSum;
  double collectedSum;
  var image;
  String owner;
  double date;

  Announce(
      {this.title,
      this.description,
      this.collectedSum,
      this.neededSum,
      this.image,
      this.owner,
      this.date});
}
var firstColor = Color(0xff6a1b9a);

Widget OneItem(Announce an, BuildContext context) {
  return GestureDetector(
    onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){ return Details(an: an,);}));},
    child: Stack(
      children: <Widget>[
        Align(
          alignment: Alignment(1, -1),
          child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      an.image,
                    ),
                    fit: BoxFit.fitWidth),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      color: Colors.grey,
                      spreadRadius: -4,
                      offset: Offset(0, 10))
                ],
              )),
        ),
        Align(
          alignment: Alignment(1, 0.8),
          child: Container(
            width: 380,
            height: 80,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.grey[800],
                    spreadRadius: -5,
                  )
                ]),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(child: Center(child: Icon(Icons.monetization_on,color: Color(0xff6a1b9a),))),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 0),
                      child: Text(
                        '${an.title}',
                        style: Theme.of(context).textTheme.title,
                        overflow: TextOverflow.ellipsis,
                      ),
                      width: 280,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 0),
                        width: 280,
                        child: Text(
                          '${an.date} days left | by : ${an.owner}',
                          style: Theme.of(context).textTheme.subtitle,
                        )),
                  ],
                ),
                Container(
                  width: 50,
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(firstColor),
                              strokeWidth : 2,
                          value: (an.collectedSum /
                              an.neededSum) /*Color(0xff6a1b9a)*/,
                        )),
                        Center(
                            child: Text(
                          '${(an.collectedSum * 100 / an.neededSum).truncate()}%',
                          style: Theme.of(context).textTheme.subtitle.copyWith(fontSize: 13),
                        )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
