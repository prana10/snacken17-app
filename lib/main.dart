import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pkkclient/app/app.dart';

void main() => runApp(
      DevicePreview(
        enabled: false,
        builder: (context) => const PkkApp(),
      ),
    );
