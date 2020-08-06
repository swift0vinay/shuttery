package com.example.shuttery;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;
import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.WallpaperManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Build;
import android.os.Bundle;



import java.io.File;
import java.io.IOException;

// import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "com.example.shuttery/wallpaper";
  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    // super.configureFlutterEngine(flutterEngine);
    GeneratedPluginRegistrant.registerWith(flutterEngine);
    new MethodChannel(flutterEngine.getDartExecutor(), CHANNEL).setMethodCallHandler(
      new MethodCallHandler() {
        @Override
        public void onMethodCall(MethodCall call, Result result) {
          if (call.method.equals("setWallpaper")) {
            int setWallpaper=setWallpaper((String) call.arguments);
            //int setWallpaper = getBatteryLevel();

            if (setWallpaper ==0) {
              result.success(setWallpaper);
            } else {
              result.error("UNAVAILABLE", "", null);
            }
          } else {
            result.notImplemented();
          }
        }
      });
  }
  private int setWallpaper(String path) {
    int setWallpaper=1;
    File imgFile = new  File(this.getApplicationContext().getCacheDir(), path);
    // set bitmap to wallpaper
    Bitmap bitmap = BitmapFactory.decodeFile(imgFile.getAbsolutePath());
    WallpaperManager wm = null;
    //if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.ECLAIR) {
      wm = WallpaperManager.getInstance(this);
   // }
    try{
     // if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.ECLAIR) {
        wm.setBitmap(bitmap);
    //  }
      setWallpaper=0;
    }catch (IOException e){
      setWallpaper=1;
    }
    return setWallpaper;
  }
  // @Override
  // public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
  //   GeneratedPluginRegistrant.registerWith(flutterEngine);
  // }
}
