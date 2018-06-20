<#-- 添加MVPArms的依赖包
an app build.gradle -->


<#macro addMVPArmsDependencies>
  <#if !hasDependency('me.jessyan:arms:${armsVersion}')>
        <dependency mavenUrl="me.jessyan:arms:${armsVersion}"/>
        <merge from="root://activities/MVPArmsTemplate/mvp.gradle.ftl"
                 to="${escapeXmlAttribute(projectLocation)}/build.gradle" />
                 <#if (language!'Java')?string == 'Kotlin'>
                 <merge from="root://activities/MVPArmsTemplate/app.gradle.kotlin.ftl"
                          to="${escapeXmlAttribute(projectOut)}/build.gradle" />
                    <#else>
                    <merge from="root://activities/MVPArmsTemplate/app.gradle.java.ftl"
                             to="${escapeXmlAttribute(projectOut)}/build.gradle" />
                 </#if>

    </#if>
</#macro>
