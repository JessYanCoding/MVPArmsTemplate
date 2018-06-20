//报错是肯定的,把上面两行弄到最上面
apply plugin: 'kotlin-kapt'
kapt {
    generateStubs = true
}
dependencies {
    kapt rootProject.ext.dependencies["dagger2-compiler"]
}
