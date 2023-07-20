import 'package:flutter/material.dart';
import 'package:machine_test_techware/services/remote_services.dart';

import '../models/employee.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee>? employees;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    employees = await RemoteService().getEmployees();
    if (employees != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Employee List',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.teal,
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          itemCount: employees?.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                  child: Image.network(employees![index].profileImage)),

              title: Text(
                employees![index].name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                employees![index].email,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            );
          },
        ),
      ),
    );
  }
}
