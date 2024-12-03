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
                setState(() {
                  _current = index;
                });
              },
              height: 200.px,
              autoPlay: true,
              viewportFraction: 1.0,
            )),
        Positioned(left: 0, right: 0, bottom: 10, child: _indicator())
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

  Widget _indicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.bannerList.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () {
            _controller.animateToPage(entry.key);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _current == entry.key ? Colors.blue : Colors.grey,
            ),
          ),
        );
      }).toList(),
    );
  }
}
