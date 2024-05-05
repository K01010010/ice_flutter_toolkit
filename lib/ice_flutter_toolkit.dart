library core;

import 'dart:convert';
import 'package:bind3/bind3.dart';
import 'package:dio/dio.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ice_flutter_toolkit/api/crashlytics_service.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:connection_notifier/connection_notifier.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;



import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart' show kMinFlingVelocity;
// import 'package:flutter/scheduler.dart';
// import 'package:flutter/services.dart' show HapticFeedback;

part 'foundation/routes/app_router/app_router_base.dart';
part 'foundation/services_repository/connection_repository.dart';
part 'ui/pages/error_service_page/error_service.dart';
part 'ui/pages/error_service_page/error_service_page.dart';

part 'ui/widgets/arrow_text_bar.dart';
part 'ui/widgets/colored_button.dart';
part 'ui/widgets/custom_app_bar.dart';
part 'ui/widgets/date_button.dart';
part 'ui/widgets/gradient_text.dart';
part 'ui/widgets/no_glow.dart';

part 'ui/widgets/widget_data/box_data.dart';
part 'ui/widgets/widget_data/text_data.dart';
part 'ui/widgets/swiper_widget/horizontal_drag_controller.dart';
part 'ui/widgets/swiper_widget/swiper_controller.dart';
part 'ui/widgets/swiper_widget/swiper_widget.dart';
part 'ui/widgets/custom_text_field/custom_text_field.dart';
part 'ui/widgets/custom_text_field/custom_text_field_controller.dart';
part 'ice_flutter_toolkit.g.dart';
part 'ui/widgets/custom_text_field/custom_text_field_outlined.dart';
part 'ui/widgets/custom_switch/custom_fade_switch_widget.dart';
part 'ui/widgets/custom_switch/custom_slide_switch_widget.dart';
part 'ui/widgets/custom_switch/switch_decorator.dart';
part 'ui/widgets/custom_dropdown_button/custom_dropdown_button.dart';
part 'ui/widgets/custom_dropdown_button/custom_dropdown_button_controller.dart';
part 'ui/widgets/bottom_bars/date_picker_bar.dart';


part 'utils/controllers/scroll_controller/custom_indexation_controller.dart';
part 'utils/app_colors.dart';
part 'utils/app_style.dart';
part 'utils/extensions.dart';
part 'utils/phone_formatter.dart';
part 'utils/storage.dart';
part 'utils/validators.dart';