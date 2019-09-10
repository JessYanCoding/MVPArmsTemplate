<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<#import "root://activities/MVPArmsTemplate/dagger2_macros.ftl" as dagger2>
<recipe>
<@kt.addAllKotlinDependencies />
<@dagger2.addAllKaptDependencies />
<#if needActivity>
    <merge from="root/AndroidManifest.xml.ftl"
           to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />
</#if>

<#if needActivity && generateActivityLayout>
    <instantiate from="root/res/layout/simple.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/${activityLayoutName}.xml" />
</#if>

<#if needFragment && generateFragmentLayout>
    <instantiate from="root/res/layout/simple.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/${fragmentLayoutName}.xml" />
</#if>


<#if needActivity>
    <instantiate from="root/src/app_package/ArtActivity.${ktOrJavaExt}.ftl"
                   to="${escapeXmlAttribute(srcOut)}${slashedPackageName(ativityPackageName)}/${pageName}Activity.${ktOrJavaExt}" />
    <open file="${escapeXmlAttribute(srcOut)}${slashedPackageName(ativityPackageName)}/${pageName}Activity.${ktOrJavaExt}" />
</#if>

<#if needFragment>
    <instantiate from="root/src/app_package/ArtFragment.${ktOrJavaExt}.ftl"
                   to="${escapeXmlAttribute(srcOut)}${slashedPackageName(fragmentPackageName)}/${pageName}Fragment.${ktOrJavaExt}" />
    <open file="${escapeXmlAttribute(srcOut)}${slashedPackageName(fragmentPackageName)}/${pageName}Fragment.${ktOrJavaExt}" />
</#if>

<#if needPresenter && presenterName?has_content>
    <instantiate from="root/src/app_package/ArtPresenter.${ktOrJavaExt}.ftl"
                   to="${escapeXmlAttribute(srcOut)}${slashedPackageName(presenterPackageName)}/${presenterName}.${ktOrJavaExt}" />
    <open file="${escapeXmlAttribute(srcOut)}${slashedPackageName(presenterPackageName)}/${presenterName}.${ktOrJavaExt}" />
</#if>

<#if needModel && modelName?has_content>
    <instantiate from="root/src/app_package/ArtModel.${ktOrJavaExt}.ftl"
                   to="${escapeXmlAttribute(srcOut)}${slashedPackageName(modelPackageName)}/${modelName}.${ktOrJavaExt}" />

    <open file="${escapeXmlAttribute(srcOut)}${slashedPackageName(modelPackageName)}/${modelName}.${ktOrJavaExt}" />
</#if>


</recipe>
