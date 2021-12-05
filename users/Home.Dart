import 'package:flutter/material.dart';
import 'package:users/src/db/database.dart';
import 'package:users/src/db/dbProvider.Dart';
import 'package:users/src/Screen/Home/widget/AppBar.Dart';
import 'package:users/src/Screen/Home/widget/ContainerUser.Dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var isLoading = false;
  var isSearching = false;
  String keyword;
  dynamic data;

  @override
  void initState() {
    super.initState();
    initapp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _buildEmployeeListView(),
    );
  }

  _buildEmployeeListView() {
    return FutureBuilder(
      future: DBProvider.db.getAllUsers(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          data = snapshot.data;
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Buscar Usuario',
                      labelStyle: TextStyle(color: Color(0xFF345e3a))),
                  onChanged: (value) {
                    keyword = value;

                    setState(() {
                      isSearching = true;
                    });
                  },
                ),
              ),
              isSearching
                  ? FutureBuilder(
                      future: DBProvider.db.searchUser(keyword),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print('error');
                        var data = snapshot.data;
                        return snapshot.hasData
                            ? ContainerUsers(data: data)
                            : new Center(
                                child: Text('List is empty'),
                              );
                      },
                    )
                  : ContainerUsers(data: data)
            ],
          );
        }
      },
    );
  }

  initapp() async {
    await _loadFromApi();
  }

  _loadFromApi() async {
    setState(() {
      isLoading = true;
    });

    var apiProvider = UserApiProvider();
    await apiProvider.getAllUser();

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }
}
