import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sunshine_iith/services/firestore_data.dart';

class LoadingData extends StatefulWidget {
  const LoadingData({super.key});

  @override
  State<LoadingData> createState() => _LoadingDataState();
}

class _LoadingDataState extends State<LoadingData> {

  @override
  void initState() {
    FirestoreData.managementTeamData('des-team');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      body: const Center(
        child: SpinKitFadingFour(
          size: 50,
          color: Colors.black,
        ),
      ),
    );
  }
}