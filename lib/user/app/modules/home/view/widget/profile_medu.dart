import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(constraints:BoxConstraints(
      minHeight: 50,
      maxHeight: 70
    ),
      child: InkWell(
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 24,
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    // color: isDark
                    //     ? Colors.amber.withOpacity(0.1)
                    //     : Colors.amber.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(100)),
                child: Icon(
                  icon,
                  color: Get.theme.primaryColor,
                  //textColor,
                  size: 18,
                  // color: isDark ? Colors.amber : Colors.amberAccent,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: Get.textTheme.labelLarge!.copyWith(color:Color(0xff00182D),fontSize: 12),
                     // overflow: TextOverflow.ellipsis
                    ),
                  ),
                  Expanded(
                    child: Text(
                      subtitle,
                      style: Get.textTheme.labelSmall!.copyWith(color: Color(0xff747474)),
                     // overflow: TextOverflow.ellipsis
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}