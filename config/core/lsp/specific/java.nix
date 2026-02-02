{pkgs, ...}: {
  plugins.java = {
    enable = true;
    settings.root_markers = [
      "settings.gradle"
      "settings.gradle.kts"
      "pom.xml"
      "build.gradle"
      "mvnw"
      "gradlew"
      "build.gradle"
      "build.gradle.kts"
      ".git"
    ];
  };
  plugins.jdtls = {
    enable = true;
    jdtLanguageServerPackage = "${pkgs.jdt-language-server}";
  };
}
