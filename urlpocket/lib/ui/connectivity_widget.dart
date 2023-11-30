import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urlpocket/provider/connectivity_provider.dart';

/// A widget that show if there its a problem when there its no connectivity for the app
/// works as "autonomous widget", but with coupled logic to the ConnectivityProvider
class ConnectivityWidget extends StatelessWidget {
  const ConnectivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //One (simple) way to access resoruces or values "outside of a widget" its using a Provider.of call
    //but generate some "dependency" th a coupled object called here "connectivity"
    ConnectivityProvider connectivity =
        Provider.of<ConnectivityProvider>(context, listen: true);

    return Visibility(
      visible: (connectivity.isConnected) ? false : true,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4,
            sigmaY: 4,
          ),
          child: Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).viewPadding.top + 16, bottom: 16),
            color: const Color.fromARGB(125, 255, 225, 0), // Yellow
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: Icon(Icons.warning)),
                Text('Waiting internet connection...'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
