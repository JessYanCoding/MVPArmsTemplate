apply from: "config.gradle"

buildscript {
    repositories {
        google()
        jcenter()
    }
}
allprojects {
    repositories {
        google()
        jcenter()
        maven {url "https://jitpack.io"}
    }
}
