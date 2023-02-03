import 'dart:async';

import 'package:flutter/material.dart';

class ImageList extends StatefulWidget {
  const ImageList({Key? key, required this.startingIndex, this.duration = 30}) : super(key: key);

  final int startingIndex;

  final int duration;

  @override
  State<ImageList> createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  late ScrollController _scrollController;
  @override
  void initState(){
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if(_scrollController.position.atEdge){
        _autoScroll();
      }
    });

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _autoScroll();
    });
  }
  _autoScroll(){
    final _currentScrollPosition = _scrollController.offset;

    final _scrollEndPosition = _scrollController.position.maxScrollExtent;

    scheduleMicrotask(() {
      _scrollController.animateTo(
        _currentScrollPosition == _scrollEndPosition? 0 : _scrollEndPosition,
        duration: Duration(seconds: widget.duration),
        curve: Curves.linear,);
    });

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130 ,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context,int index){
            return _ImageTile(image: 'assets/image/${widget.startingIndex + index}.jpg');
          }
      ),
    );
  }
}

class _ImageTile extends StatelessWidget {
  const _ImageTile({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: image,
        child: Image.asset(
          image,
          width: 130,
        ));
  }
}

