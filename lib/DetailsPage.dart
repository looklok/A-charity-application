import 'package:flutter/material.dart';
import 'Items.dart';
import 'main.dart';

class Details extends StatelessWidget {
  Announce an;

  Details({this.an});

  @override
  Widget build(BuildContext context) {
    double maxheight = MediaQuery.of(context).size.height;
    double maxwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          height: maxheight,
          width: maxwidth,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              an.image,
            ),
            fit: BoxFit.fitHeight,
          )),
        ),
        Opacity(
          opacity: 0.4,
          child: Container(
            height: maxheight,
            width: maxwidth,
            color: Color(0xff6a1b9a),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.all(20),
            width: maxwidth,
            height: maxheight * 2 / 3,
            decoration: BoxDecoration(
              color: Colors.black38,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.monetization_on,
                      size: (maxwidth - 40) / 8,
                      color: secondColor,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Text(
                      '${an.title}',
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: Colors.white),
                    )),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  '${an.description}',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '${an.collectedSum} DZD ',
                      style: TextStyle(
                          color: secondColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                    Text(
                      'collected from ${an.neededSum} DZD',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',)
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                Container(
                  height: maxheight/12,
                  width: maxwidth-40,
                  decoration: BoxDecoration(color: secondColor, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text('Donate',style:  TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat', fontSize: 20) ,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
