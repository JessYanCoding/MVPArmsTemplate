<?xml version="1.0"?>
<recipe>
<#if needActivity>
    <#include "../common/recipe_manifest.xml.ftl" />
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
    <instantiate from="root/src/app_package/ArtActivity.java.ftl"
                   to="${manifestOut}/java/${slashedPackageName(ativityPackageName)}/${pageName}Activity.java" />
    <open file="${manifestOut}/java/${slashedPackageName(ativityPackageName)}/${pageName}Activity.java" />
</#if>

<#if needFragment>
    <instantiate from="root/src/app_package/ArtFragment.java.ftl"
                   to="${manifestOut}/java/${slashedPackageName(fragmentPackageName)}/${pageName}Fragment.java" />
    <open file="${manifestOut}/java/${slashedPackageName(fragmentPackageName)}/${pageName}Fragment.java" />
</#if>

<#if needPresenter && presenterName?has_content>
    <instantiate from="root/src/app_package/ArtPresenter.java.ftl"
                   to="${manifestOut}/java/${slashedPackageName(presenterPackageName)}/${presenterName}.java" />
    <open file="${manifestOut}/java/${slashedPackageName(presenterPackageName)}/${presenterName}.java" />
</#if>

<#if needModel && modelName?has_content>
    <instantiate from="root/src/app_package/ArtModel.java.ftl"
                   to="${manifestOut}/java/${slashedPackageName(modelPackageName)}/${modelName}.java" />

    <open file="${manifestOut}/java/${slashedPackageName(modelPackageName)}/${modelName}.java" />
</#if>


</recipe>
