import 'package:flutter/material.dart';

class SelectVotingCard extends StatelessWidget {
  const SelectVotingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://cdn.www.gob.pe/uploads/document/file/2862237/standard_ONPE%20mantiene%20prohibici%C3%B3n%20del%20uso%20de%20celulares%20y%20c%C3%A1maras%20fotogr%C3%A1ficas%20y%20de%20video%20en%20las%20c%C3%A1maras%20secretas.png.png'))),
        margin: EdgeInsets.all(5),
        width: screenWidth,
        height: screenHeight * 0.4,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.5),
                Colors.black.withOpacity(.1),
              ])),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Elecciones Distritales",
                style: TextStyle(color: Colors.white, fontSize: 25),
              )
            ],
          ),
        ));
  }
}
