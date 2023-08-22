import 'package:flutter/material.dart';


class StarRating extends StatelessWidget {
  final double? rating;
  final double? size;
  final Color? setColor;
  final bool? isCenter;
  StarRating({this.rating, this.size,this.setColor,this.isCenter});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: (isCenter!)?MainAxisAlignment.center:MainAxisAlignment.start,
      crossAxisAlignment: (isCenter!)?CrossAxisAlignment.center:CrossAxisAlignment.start,
        children: new List.generate(5, (index) => _buildStar(index, rating!,setColor!)));
  }

  _buildStar(int index, double rating,Color colorSet) {
    IconData icon;
    Color color;
    if (index >= rating) {
      icon = Icons.star;
      color = Colors.grey;
    } else if (index > rating - 1 && index < rating) {
      icon = Icons.star_half;
      color =colorSet;
    } else {
      icon = Icons.star;
      color = colorSet;
    }
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}
