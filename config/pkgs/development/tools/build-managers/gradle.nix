{ config, pkgs, ... }:

{
  home = {
    file = {
      ".gradle/gradle.properties".text = ''
        systemProp.http.proxyHost=127.0.0.1
        systemProp.http.proxyPort=8118
        systemProp.https.proxyHost=127.0.0.1
        systemProp.https.proxyPort=8118
      '';
    };
    packages = with pkgs; [
      gradle
    ];
  };
}
