import "package:flutter/material.dart";
import 'package:quicken_app/src/data_models/data_model.dart';

class DataItemCard extends StatelessWidget {
  final BuildContext context;
  final Data data;

  DataItemCard(this.context, this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      padding: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width/2.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
              blurRadius: 5.0, offset: Offset(0, 3), color: Colors.black12),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              "Name: " + data.name.toString() + " ",
              textAlign: TextAlign.left,
              style: new TextStyle(
                fontSize: MediaQuery.of(context).size.width / 22,
              ),
            ),
          ),
          SizedBox(height: 4),
          Container(
            child: Text(
              "Date: " + data.date.toString(),
              textAlign: TextAlign.left,
              style: new TextStyle(
                fontSize: MediaQuery.of(context).size.width / 22,
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            child: Text(
              data.description.toString() + " ",
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: MediaQuery.of(context).size.width / 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
