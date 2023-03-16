import 'package:flutter/material.dart';
import 'package:spice_tracker/core/app_colors.dart';
import 'package:spice_tracker/core/images_location.dart';

class Mswitch extends StatefulWidget {
  final bool switchvalue;
  final Function(bool)? onSwitchChange;
  Mswitch({Key? key, this.onSwitchChange, this.switchvalue = false})
      : super(key: key);

  @override
  State<Mswitch> createState() => _MswitchState();
}

class _MswitchState extends State<Mswitch> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33,
      child: Switch(
        onChanged: (_) {
          if (widget.onSwitchChange != null)
            widget.onSwitchChange!(!widget.switchvalue);
        },
        value: widget.switchvalue,
        activeColor: AppColors.main_blue,
        activeTrackColor: AppColors.TRACK_BACK_GREY_BLUE,
        inactiveThumbColor: AppColors.PLAYER_BUTTON_BACKGROUND,
        inactiveTrackColor: AppColors.BORDER_WHITE_BUTTON,
      ),
    );
  }
}
