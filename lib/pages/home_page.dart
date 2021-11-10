import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
    getData();
  }

  getData() async {
    String path = "http://192.168.1.5:8000/api/task-list/";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bienvenido",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        "My Tasks",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 40.0,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 26,
                    backgroundImage: NetworkImage("https://images.pexels.com/photos/412840/pexels-photo-412840.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                  )
                ],
              ),
              SizedBox(height: 14.0),
              ListView.builder(
                itemCount: 10,
                primary: true,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.05),
                          offset: Offset(2,5),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text("Ir de compras"),
                      subtitle: Text("Ir a metro a comprar tortillas"),
                      trailing: Checkbox(
                        value: true,
                        onChanged: (bool? value){

                        },
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
