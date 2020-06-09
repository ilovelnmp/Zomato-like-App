import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zomatodummyapp/bloc/IndividualRestaurantBloc.dart';
import 'package:zomatodummyapp/model/IndividualRestaurantDetails.dart';

class ProductInfo extends StatefulWidget {
  final restID;
  ProductInfo({this.restID});
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  TextStyle _textStyle;
  @override
  void initState() {
    _textStyle = TextStyle(
        color: Colors.black.withOpacity(0.65), fontWeight: FontWeight.w400);
    super.initState();
  }

  bool onTapped = false;

  @override
  Widget build(BuildContext context) {
    individualRestaurantDetailBloc.fetchIndividualRestDetail(widget.restID);
    return StreamBuilder<IndividualRestaurantDetail>(
      stream: individualRestaurantDetailBloc.individualRestDetails,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final individualRestaurantData = snapshot.data;

        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      //Img box insert
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 25.0,
                            height: 5.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.0),
                              color: const Color(0xff365eff),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Stack(
                        children: <Widget>[
                          individualRestaurantData.featuredImg != ''
                              ? ClipRRect(
                                  child: Image.network(
                                      individualRestaurantData.featuredImg),
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 35,
                                        ),
                                        Icon(
                                          Icons.priority_high,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'No Img Found',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    )),
                                  ],
                                ),
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  onTapped = !onTapped;
                                });
                              },
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  child: Center(
                                    child: SvgPicture.string(
                                      _svg_qqrib0,
                                      color: onTapped
                                          ? Color(0xFF365eff)
                                          : Colors.white,
                                      allowDrawingOutsideViewBox: true,
                                    ),
                                  ),
                                  width: 50.0,
                                  height: 38.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(2.0),
                                      topRight: Radius.circular(20.0),
                                      bottomRight: Radius.circular(2.0),
                                      bottomLeft: Radius.circular(20.0),
                                    ),
                                    color: const Color(0xff99adff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //Restaurant name, review
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              individualRestaurantData.restaurantName ?? 'Nil',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Row(
                              children: <Widget>[
                                RatingStars(
                                  ratings:
                                      individualRestaurantData.ratings ?? '0',
                                ),
                                Text(
                                  '${individualRestaurantData.ratings ?? 0}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '  (${individualRestaurantData.reviewCount ?? 0} Reviews)',
                                  style: _textStyle,
                                ),
                              ],
                            ),
                            Text(
                              '${individualRestaurantData.establishment ?? 'Nil'} - ${individualRestaurantData.cuisines ?? 'Nil'}',
                              style: _textStyle,
                            ),
                            Wrap(
                              children: <Widget>[
                                Text(
                                  individualRestaurantData.location ?? 'Nil',
                                  style: _textStyle,
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Cost for two - \$${individualRestaurantData.costForTwo ?? 0} ',
                                  style: _textStyle,
                                ),
                                Spacer(),
                                Icon(
                                  Icons.local_phone,
                                  color: Colors.green,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(24)),
                          color: Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x1a000000),
                              offset: Offset(8, 1),
                              blurRadius: 25,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      //Row review photo
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Icon(Icons.star),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Review',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.7)))
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Icon(Icons.photo_camera),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Photo',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.7)))
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Icon(Icons.bookmark_border),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Bookmark',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.7)))
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Icon(Icons.flag),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Report',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.7)))
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Icon(Icons.share),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Share',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7)),
                                )
                              ],
                            )
                          ],
                        ),
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x1a000000),
                              offset: Offset(8, 1),
                              blurRadius: 25,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      //Book a Table
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.fastfood),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Book a table',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                                Text('Get instant confirmations',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black.withOpacity(0.6)))
                              ],
                            ),
                            Spacer(),
                            CircleAvatar(
                              radius: 13,
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              child: Icon(
                                Icons.arrow_forward,
                                size: 18,
                              ),
                            )
                          ],
                        ),
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x1a000000),
                              offset: Offset(8, 1),
                              blurRadius: 25,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'ADDRESS',
                              style: TextStyle(
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              individualRestaurantData.address ?? 'Nil',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8)),
                            ),
                            Row(
                              children: <Widget>[
                                FlatButton.icon(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.content_copy,
                                      color: Colors.redAccent,
                                    ),
                                    label: Text(
                                      'Copy Location',
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )),
                                SizedBox(
                                  width: 20,
                                ),
                                FlatButton.icon(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.directions,
                                      color: Colors.redAccent,
                                    ),
                                    label: Text(
                                      'Get Directions',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.redAccent,
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x1a000000),
                              offset: Offset(8, 1),
                              blurRadius: 25,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'DETAILS',
                              style: TextStyle(
                                  letterSpacing: 3,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'CUISINES',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              individualRestaurantData.cuisines ?? 'Nil',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'OTHER INFO',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            individualRestaurantData.highlights != null
                                ? Wrap(
                                    runSpacing: 10,
                                    children: List.generate(
                                        individualRestaurantData
                                            .highlights.length,
                                        (index) => Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.45,
                                              child: SingleChildScrollView(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.check_circle,
                                                      color: Colors.green,
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                          individualRestaurantData
                                                                  .highlights[
                                                              index]),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )),
                                  )
                                : Container(),
                          ],
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        height: MediaQuery.of(context).size.height * 0.55,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x1a000000),
                              offset: Offset(8, 1),
                              blurRadius: 25,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  height: MediaQuery.of(context).size.height * 1.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20)
                      ]),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

const String _svg_qqrib0 =
    '<svg viewBox="0.0 0.0 24.0 24.0" ><path  d="M 0 0 L 24 0 L 24 24 L 0 24 L 0 0 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /><path transform="translate(3.0, 4.5)" d="M 13.5 0 C 11.89000034332275 0 10.00800037384033 1.825000047683716 9 3 C 7.992000102996826 1.825000047683716 6.110000133514404 0 4.5 0 C 1.651000022888184 0 0 2.221999883651733 0 5.050000190734863 C 0 8.182999610900879 3 11.5 9 15 C 15 11.5 18 8.25 18 5.25 C 18 2.421999931335449 16.34900093078613 0 13.5 0 Z" fill="#365eff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';

class RatingStars extends StatefulWidget {
  final ratings;
  RatingStars({this.ratings});

  @override
  _RatingStarsState createState() => _RatingStarsState();
}

class _RatingStarsState extends State<RatingStars> {
  int convertedRating = 0;

  int ratingVariableConverter() {
    if (widget.ratings.runtimeType == String) {
      String temp = widget.ratings;
      temp = temp.substring(0, 1);
      convertedRating = int.parse(temp);
      return convertedRating;
    } else if (widget.ratings.runtimeType == int) {
      return convertedRating = widget.ratings;
    }
  }

  @override
  void initState() {
    ratingVariableConverter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          5,
          (index) => Icon(
                Icons.star,
                color: index < convertedRating ? Colors.black : Colors.grey,
              )),
    );
  }
}
