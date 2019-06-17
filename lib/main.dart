import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListView",
      color: Colors.amberAccent,
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
          backgroundColor: Colors.blue,
        ),
        body: getListView(),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), tooltip: "Click Me", onPressed: () {}),
      ),
    );
  }
}

List<String> getList() {
  var items = List<String>.generate(1000, (counter) => "Item $counter");
  return items;
}

Widget getListView() {
  var listitems = getList();
  var listview = ListView.builder(itemBuilder: (context, index) {
    return ListTile(
      title: Text(listitems[index]),
      onTap: () {
        getSnackBar(context, listitems[index]);
        /* debugPrint("${listitems[index]} Clicked");*/
        /* Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text("${listitems[index]} Clicked"),
          duration: Duration(microseconds: 15) ,
        ));*/
      },
    );
  });
  return listview;
}

void getSnackBar(BuildContext context, String item) {
  var snackbar = SnackBar(
    content: Text("$item clicked"),
    //duration: Duration(seconds:),
    action: SnackBarAction(label: "Undo", onPressed: () {}),
  );
  Scaffold.of(context).showSnackBar(snackbar);
}
