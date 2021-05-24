import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Figma Flutter Generator GraigeoguideWidget - TEXT
                Text(
                  'GRAIGEOGUIDE',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(228, 70, 79, 1),
                      fontFamily: 'Noto Sans CJK KR',
                      fontSize: 12,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )
              ],
            ),
            Row(
              children: index == 0 ? [
                Image.asset('images/phone1.png'),
                Image.asset('images/girl.png')
              ] : [
                Image.asset('images/phone2.png')
              ],
            )
          ],
        );
      },
      pagination: SwiperPagination(
        alignment: Alignment(-0.5,0.2),
        builder: DotSwiperPaginationBuilder(
          color: Colors.grey,
          activeColor: Color.fromRGBO(247, 50, 78, 1)
        )
      ),
      autoplay: true,
    );
  }
}
