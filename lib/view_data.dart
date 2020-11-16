import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance;

class ViewDataPage extends StatefulWidget {
  @override
  _ViewDataPageState createState() => _ViewDataPageState();
}

class _ViewDataPageState extends State<ViewDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Interns'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 30,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            MessagesStream(),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('interns').snapshots(),
      // ignore: missing_return
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.docs;
        List<InternSingle> interns = [];
        for (var message in messages) {
          final internName = message.data()['name'];
          final internDept = message.data()['dept'];

          final intern = InternSingle(
            name: internName,
            dept: internDept,
          );
          interns.add(intern);
        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20.0,
            ),
            children: interns,
          ),
        );
      },
    );
  }
}

class InternSingle extends StatelessWidget {
  final String name;
  final String dept;

  const InternSingle({this.name, this.dept});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        '$name of $dept',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
