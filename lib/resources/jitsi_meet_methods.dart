

import 'package:flutter/cupertino.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';




import 'package:zoom_clone/resources/auth_methods.dart';

class JitsiMeetMethods{
  final AuthMethods _authMethods = AuthMethods();
  void createMeeting({required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username ='',

  }) async {
    try {


      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION; // Limit video resolution to 360p

    String? name;
     if (username.isEmpty)
       {
         name=_authMethods.user.displayName;
       }
     else
       {
         name = username;
       }

      var options = JitsiMeetingOptions(room: roomName,)

        ..userDisplayName = name
        ..userEmail =  _authMethods.user.email
        ..userAvatarURL = _authMethods.user.photoURL  // or .png
        ..audioMuted = isAudioMuted
        ..serverURL= "https://meet.jit.si"
        ..videoMuted = isVideoMuted
        ..webOptions = {
          "roomName": roomName,
          "width": "100%",
          "height": "100%",
          "enableWelcomePage": false,
          "chromeExtensionBanner": null,
          "userInfo": {"displayName": _authMethods.user.displayName}
        };


      await JitsiMeet.joinMeeting(options);
    }

    catch (error) {
      debugPrint("error: $error");
    }

  }
}