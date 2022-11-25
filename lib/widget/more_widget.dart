import 'package:flutter/material.dart';

class MoreWidget extends StatelessWidget {
  const MoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        moreItemWidget(Icons.language, 'Language', langCode: 'en'),
        moreItemWidget(Icons.security, 'Privacy Policy'),
        moreItemWidget(Icons.headphones, 'Customer Support'),
        moreItemWidget(Icons.settings, 'Setting'),
      ],
    );
  }

  Widget moreItemWidget(IconData iconData, String title, {String? langCode}){

    Widget trailing;
    if(langCode == null){
      trailing = const Icon(Icons.chevron_right);
    } else {
      trailing = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('lib/image/ic_flag_$langCode.png'),
          const Icon(Icons.chevron_right)
        ],
      );
    }


    return ListTile(
      leading: Icon(iconData),
      title: Text(title),
      trailing: trailing,
    );
  }

}
