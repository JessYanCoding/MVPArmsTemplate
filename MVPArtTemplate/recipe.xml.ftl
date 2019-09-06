<?xml version="1.0"?>
<#import "root://gradle-projects/NewArmsModule/kotlin_macros.ftl" as kt>
<recipe>
 <@kt.addAllKotlinDependencies />
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
