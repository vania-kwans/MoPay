import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class TrackOrderTile extends StatefulWidget {
  final String date;
  final String title;
  final String description;
  final bool hasCompletedState;

  /// For Blue color
  final bool currentActiveState;

  /// For Heartbeat Animation
  final bool initialAnimation;
  final double bottomSpace;
  final Function? didFinishAnimation;

  const TrackOrderTile({
    this.date = '',
    this.title = '',
    this.description = '',
    this.hasCompletedState = false,
    this.initialAnimation = false,
    this.currentActiveState = false,
    this.didFinishAnimation,
    this.bottomSpace = 32,
    Key? key,
  }) : super(key: key);

  @override
  TrackOrderTileState createState() => TrackOrderTileState();
}

class TrackOrderTileState extends State<TrackOrderTile>
    with TickerProviderStateMixin {
  final GlobalKey _keyOrderState = GlobalKey();

  late AnimationController _lineDrawAnimationController;
  late Animation _dashLineTween;

  late AnimationController _heartbeatAnimationController;
  late Animation<double> _heartbeatAnimation;

  double _dashLineHeight = 0.0;
  late bool _showRightCheckImage = true;

  @override
  void initState() {
    super.initState();

    _configureHeartBeatAnimationAnimation();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _configureAnimation();

      /// To Show the animation for Order confirmed state.
      if (widget.initialAnimation) {
        startAnimation();
      }
    });
  }

  void _configureHeartBeatAnimationAnimation() {
    /// Heart Beat animation.
    _heartbeatAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _heartbeatAnimation = Tween(begin: 1.0, end: 1.28).animate(CurvedAnimation(
        parent: _heartbeatAnimationController, curve: Curves.fastOutSlowIn));
    _heartbeatAnimationController.repeat(reverse: true);
  }

  //Animation
  void _configureAnimation() {
    var lineHeight = 50.0;
    var orderContext = _keyOrderState.currentContext;
    if (orderContext != null) {
      var renderBox = orderContext.findRenderObject() as RenderBox;
      lineHeight = renderBox.size.height - 25;
    }

    /// Dashed line animation.
    _lineDrawAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _dashLineTween =
        Tween(begin: 0.0, end: lineHeight).animate(_lineDrawAnimationController)
          ..addListener(() {
            _dashLineHeight = _dashLineTween.value;
          });
  }

  @override
  void dispose() {
    _heartbeatAnimationController.dispose();
    _lineDrawAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                widget.date,
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 1.0, right: 20),
            child: Column(
              children: [
                !_showRightCheckImage
                    ? Container(
                        color: Colors.red,
                      )
                    : widget.currentActiveState
                        ? _currentActiveBadgeContainer()
                        : SizedBox(
                            height: 25,
                            width: 25,
                            child: _badgeContainer(),
                          ),
                Expanded(
                  child: SizedBox(
                    width: 20,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: VerticalDivider(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              key: _keyOrderState,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  widget.title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(widget.description,
                    maxLines: 2,
                    style: const TextStyle(color: Colors.grey, fontSize: 14)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _badgeContainer() {
    if (_showRightCheckImage) {
      return Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            border: Border.all(color: Colors.grey)),
      );
    }
    return Container();
  }

  Widget _currentActiveBadgeContainer() {
    return ScaleTransition(
      scale: _heartbeatAnimation,
      child: Container(
        height: 25,
        width: 25,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
      ),
    );
  }

  void hasDelivered() {
    _showRightCheckImage = true;
  }

  void startAnimation() {
    _showRightCheckImage = true;
    Future.delayed(const Duration(milliseconds: 200)).then((value) {
      _lineDrawAnimationController.forward().then((value) {
        var callBack = widget.didFinishAnimation;
        if (callBack != null) {
          callBack();
        }
      });
    });
  }
}
