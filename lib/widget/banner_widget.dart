import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:trip_flutter_demo/util/screen_help.dart';

class BannerWidget extends StatefulWidget {
  final List<String> bannerList;
  const BannerWidget(
    this.bannerList, {
    super.key,
  });

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CarouselSlider(
            carouselController: _controller,
            items: widget.bannerList
                .map((item) => _buildItem(item, width))
                .toList(),
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                _current = index;
              },
              height: 200.px,
              autoPlay: true,
              viewportFraction: 1.0,
            ))
      ],
    );
  }

  Widget _buildItem(String item, double width) {
    return GestureDetector(
      onTap: () {},
      child: Image.network(
        item,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }
}
