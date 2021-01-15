import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snapper/Pages/MainPages/exportPageBundle.dart';
import 'package:snapper/Pallete.dart';
import 'package:snapper/UI/ListStyleStatus.dart';
import 'package:snapper/UI/shared/AppBarConstWidget.dart';
import 'package:snapper/UI/shared/CustomCircleAvatarOpacity.dart';
import 'package:snapper/UI/shared/TopPaddingComponent.dart';
import 'dart:math' as math;

class Chats extends StatelessWidget {
  const Chats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            forceElevated: false,
            leadingWidth: 100.0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: AppBarConstWidget(
                specificColor: loadingColor,
              ),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              "Chat",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            elevation: 1.0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TrailingAppBarChat(),
              ),
            ],
          ),
          SliverFixedExtentList(
            itemExtent: 70.0, // I'm forcing item heights
            delegate: SliverChildBuilderDelegate(
              (context, index) => ChatListTile(
                status: 'videoSnapReceived',
              ),
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class ChatListTile extends StatelessWidget {
  final String status;
  ChatListTile({Key key, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListStyleStatus listStyleStatus = getListStyleStatus(status);
    return ListTile(
      leading: CircleAvatar(
        radius: 25.0,
      ),
      title: Text(
        "Person Name",
        style: TextStyle(
            fontWeight: FontWeight.w800, fontSize: 15.0, color: Colors.black87),
      ),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            listStyleStatus.squareIcon ?? FontAwesomeIcons.square,
            color: listStyleStatus.squareColor ?? Colors.black45,
            size: 10.5,
          ),
          hspace5,
          Text(
            listStyleStatus.text ?? "Received",
            style: TextStyle(
              color: listStyleStatus.fontColor ?? Colors.grey,
              fontSize: 10.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
      trailing: Transform(
        transform: Matrix4.rotationY(math.pi),
        child: Icon(
          Icons.chat_bubble_outline,
          color: Colors.black45,
          size: 18.0,
        ),
      ),
    );
  }
}

class TrailingAppBarChat extends StatelessWidget {
  const TrailingAppBarChat({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BuildOpacityButton(
          iconData: Icons.person_add_alt_1,
          color: Colors.black45,
        ),
        hspace10,
        BuildOpacityButton(
          iconData: Icons.chat_bubble_rounded,
          color: Colors.black45,
        ),
        hspace10,
      ],
    );
  }
}
