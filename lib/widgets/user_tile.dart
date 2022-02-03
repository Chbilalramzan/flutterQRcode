import 'package:flutter/material.dart';
import 'package:qrcode/model/user_info.dart';
import 'package:qrcode/styles/app_colors.dart';
import 'package:qrcode/styles/app_styletext.dart';
import 'package:qrcode/utils/constants/size_constants.dart';
import 'package:intl/intl.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    Key? key,
    required this.width, required this.user, required this.formattedDate
  }) : super(key: key);

  final double width;
  final UserInfo user;
  final String formattedDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      height: 76,
      width: width * 0.65,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(Sizes.dimen_12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(user.image),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        user.fname + " " + user.lname,
                        style: AppStyleText.largeTitleM18P,
                      ),
                      const Text(
                        'Check-in',
                        style: AppStyleText.infoDetailR16S,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:  [
                      Text(user.userRole.name, style: AppStyleText.infoDetailR16D7),
                      
                      SizedBox(child: Text(formattedDate, style: AppStyleText.infoDetailR16D4),),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
