import 'package:flutter/material.dart';
import 'package:get/get.dart';
class NetworkDisabled extends StatelessWidget {

  final VoidCallback onPressed;


  NetworkDisabled({this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.signal_cellular_off,size: Get.width*0.1,),
          SizedBox(height: 20,),
          Center(
            child: Text('Please enable mobile data or wifi.'),
          ),
          SizedBox(height: 20,),
          FlatButton(
            child: Text('Retry'),
            onPressed: onPressed,
            color: Get.theme.primaryColor,
          )
        ],
      ),
    );
  }
}

//Read More - Less
class ReadMoreText extends StatefulWidget {
  final String text;
  final Color expandingButtonColor;
  final double height;
  final String dateTimeText;
  ReadMoreText(this.text, this.height, this.dateTimeText, {this.expandingButtonColor});

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText>
    with TickerProviderStateMixin<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final expandingButtonColor = widget.expandingButtonColor != null
        ? widget.expandingButtonColor
        : Colors.black;
    return Column(children: <Widget>[
      AnimatedSize(
          vsync: this,
          duration: const Duration(milliseconds: 500),
          child: ConstrainedBox(
              constraints: isExpanded
                  ? BoxConstraints()
                  : BoxConstraints(maxHeight: widget.height),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  widget.text,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ))),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
              child: Text('${isExpanded ? 'Show less <' : 'Read more >'}',
                  style: TextStyle(color: expandingButtonColor)),
              onPressed: () => setState(() => isExpanded = !isExpanded)
          ),
          Text(widget.dateTimeText,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Colors.black,
            ),)
        ],
      )
    ]
    );
  }
}

// Account details custom InfoTile
class InfoTile extends StatelessWidget {
  final String title;
  final String subTitle;
  InfoTile({this.title, this.subTitle}):assert(title!=null);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,style: TextStyle(color: Get.theme.primaryColorLight,fontSize: 11.0)),
          Text(subTitle,style: TextStyle(color: Colors.black,fontSize: 17.0),),
        ],
      ),
    );
  }
}

//loading widget
class EliteLoading extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Get.theme.primaryColor,
        ),
      ),
    );
  }
}