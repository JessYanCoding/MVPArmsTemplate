
apply plugin: 'kotlin-kapt'
kapt {
    generateStubs = true
}
//在没有提前配置kotlin的情况下,
//会报错,请将apply plugin: 'kotlin....相关
//放到最上面
dependencies {
    kapt rootProject.ext.dependencies["dagger2-compiler"]
}
