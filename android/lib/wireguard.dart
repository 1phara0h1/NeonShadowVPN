import 'dart:io';
import 'package:flutter/services.dart';

class WireGuard {
  static const _channel = MethodChannel('wireguard');

  static Future<bool> prepare() async =>
      await _channel.invokeMethod('prepare');

  static Future<void> start(String name, String cfg) async =>
      await _channel.invokeMethod('start', {'name': name, 'cfg': cfg});

  static Future<void> stop(String name) async =>
      await _channel.invokeMethod('stop', {'name': name});
}
