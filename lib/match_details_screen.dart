import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MatchDetailsScreen extends StatelessWidget {
  final String matchName, matchId;

  const MatchDetailsScreen({Key? key, required this.matchName, required this.matchId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(matchName),
      ),
      body: Column(
        children: [
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance.collection('football').doc(matchId).snapshots(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done){
                if(snapshot.hasError){
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if(snapshot.hasData){
                  final item = snapshot.data;
                  return Card(
                    margin: EdgeInsets.all(16),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(),
                          Text(item?.get('p1') + ' vs ' + item?.get('p2'), style: const TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold
                          ),),
                          Text(item?.get('goals'), style: const TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),),
                          Text("Time : ${item?.get('current_min')}", style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),),
                          Text("Total Time : ${item?.get('total_min')}", style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),),
                        ],
                      ),
                    ),
                  );
                }

              }
              return const SizedBox();
            }
          )
        ],
      ),
    );
  }
}
