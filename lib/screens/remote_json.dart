import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:json_remote_example_iki/entities/user.dart';

class RemoteJson extends StatefulWidget {
  @override
  _RemoteJsonState createState() => _RemoteJsonState();
}

class _RemoteJsonState extends State<RemoteJson> {
  List<User> _users = List<User>();
  Future<List<User>> getUsers() async {
    var url = 'https://jsonplaceholder.typicode.com/users';

    var response = await http.get(url);

    var users = List<User>();

    if (response.statusCode == 200) {
      var usersJson = json.decode(response.body);
      for (var userJson in usersJson) {
        users.add(User.fromJson(userJson));
      }
    } else {
      Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      );
    }
    return users;
  }

  @override
  void initState() {
    getUsers().then((value) {
      setState(() {
        _users.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Json Data"),
      ),
      body: FutureBuilder(
        future: getUsers(),
        builder: (context, index) {
          return ListView.builder(
            itemCount: _users.length,
            itemBuilder: (context, index) {
              return Container(
                height: 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade600,
                      blurRadius: 7.0,
                    ),
                  ],
                ),
                margin: EdgeInsets.all(3.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "Id : " + _users[index].id.toString(),
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                      subtitle: Text(
                        "Mail : " + _users[index].email,
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
