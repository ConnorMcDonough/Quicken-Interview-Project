
import 'package:flutter/material.dart';


class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quicken Homework Project"),
      ),
      body: Center(

      ),
    );
  }

  // Widget buildInitialInput(BuildContext context) {
  //   final webblocBloc = context.watch<WebblocBloc>();
  //   webblocBloc.add(FetchData());
  //   webblocBloc.close();
  //   return Container();
  // }

  // Widget buildLoading() {
  //   return Center(
  //     child: CircularProgressIndicator(),
  //   );
  // }

  // Widget buildColumnWithData(List<Data> data, BuildContext context) {
  //   return Scrollbar(
  //     child: ListView.builder(
  //         itemCount: data?.length ?? 0,
  //         itemBuilder: (context, index) {
  //           return Container(
  //             child: DataItemCard(context, data[index]),
  //           );
  //         }),
  //   );
  // }
}
