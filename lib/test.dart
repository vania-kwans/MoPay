import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mopay_ewallet/belajar_komponen.dart';

class TrackYourOrderPage extends StatefulWidget {
  const TrackYourOrderPage({Key? key}) : super(key: key);

  @override
  _TrackYourOrderPageState createState() => _TrackYourOrderPageState();
}

class _TrackYourOrderPageState extends State<TrackYourOrderPage> {
  final GlobalKey<TrackOrderTileState> _keyOrderConfirmed = GlobalKey();
  final GlobalKey<TrackOrderTileState> _keyOrderDispatched = GlobalKey();
  final GlobalKey<TrackOrderTileState> _keyOutForDelivery = GlobalKey();
  final GlobalKey<TrackOrderTileState> _keyDelivered = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "My Address",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        elevation: 1.5,
        leading: RotationTransition(
          turns: const AlwaysStoppedAnimation(180 / 360),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () {},
          ),
        ),
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: _orderTrackingContainer(),
      ),
    );
  }

  Widget _orderTrackingContainer() {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TrackOrderTile(
              key: _keyOrderConfirmed,
              hasCompletedState: true,
              initialAnimation: true,
              date: '12:00 PM',
              title: "Order Placed",
              description: "Your order #5795 was placed for delivery.",
              didFinishAnimation: () {
                /// To Show the animation for Order Dispatched state.
                var state = _keyOrderDispatched.currentState;
                if (state != null) {
                  state.startAnimation();
                }
              },
            ),
            TrackOrderTile(
              key: _keyOrderDispatched,
              hasCompletedState: true,
              date: '12:10 PM',
              title: "Pending",
              description:
                  "Your order is pending for confirmation. will confirmed within 5 minutes.",
              didFinishAnimation: () {
                /// To Show the animation for Out For Delivery state.
                var state = _keyOutForDelivery.currentState;
                if (state != null) {
                  state.startAnimation();
                }
              },
            ),
            TrackOrderTile(
              date: '12:25 PM',
              title: "Confirmed",
              description:
                  "Your order is Confirmed. will delivery soon within 20 minutes.",
              currentActiveState: true,
              key: _keyOutForDelivery,
              didFinishAnimation: () {
                /// To Show Delivered state
                /// Execute this code once received Delivered success status from server.
                var state = _keyDelivered.currentState;
                if (state != null) {
                  state.hasDelivered();
                }
              },
            ),
            TrackOrderTile(
              key: _keyDelivered,
              title: "Delivered",
              bottomSpace: 0,
            ),
          ],
        ),
      ),
    );
  }
}
