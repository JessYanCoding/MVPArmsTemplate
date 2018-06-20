
dependencies {
    annotationProcessor rootProject.ext.dependencies["dagger2-compiler"]
}
android {
  compileOptions {
    sourceCompatibility JavaVersion.VERSION_1_8
    targetCompatibility JavaVersion.VERSION_1_8
  }
}
