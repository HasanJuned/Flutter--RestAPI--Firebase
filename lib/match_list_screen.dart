import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'match_details_screen.dart';

class MatchListScreen extends StatelessWidget {
  const MatchListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('football').snapshots(),
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
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length ?? 0,
                  itemBuilder: (context, index){
                    final QueryDocumentSnapshot item = snapshot.data!.docs[index];
                    return ListTile(
                      onTap: (){
                        Navigator.push(
                              context,
                            MaterialPageRoute(
                                  builder: (context) => MatchDetailsScreen(
                                        matchName: item.get('match_name'),
                                        matchId: item.id,
                                      )));
                        },
                        title: Text(item.get('p1') + ' vs ' + item.get('p2')),
                      trailing: const Icon(Icons.arrow_forward),
                    );
                  });
            }

          }
          return const SizedBox();
        }
      ),

    );
  }
}
