package com.example.sacanner_pigeon_app

import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterFragmentActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        BiometricAuthApi.setUp(
            flutterEngine.dartExecutor.binaryMessenger,
            BiometricAuthApiImpl(this)
        )
    }
}
