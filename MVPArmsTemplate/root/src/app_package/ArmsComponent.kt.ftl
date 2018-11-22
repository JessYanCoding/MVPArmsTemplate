package ${componentPackageName}

import dagger.Component
import com.jess.arms.di.component.AppComponent

import ${moudlePackageName}.${pageName}Module

<#if needActivity && needFragment>
import com.jess.arms.di.scope.ActivityScope
import ${ativityPackageName}.${pageName}Activity
import ${fragmentPackageName}.${pageName}Fragment
<#elseif needActivity>
import com.jess.arms.di.scope.ActivityScope
import ${ativityPackageName}.${pageName}Activity
<#elseif needFragment>
import com.jess.arms.di.scope.FragmentScope
import ${fragmentPackageName}.${pageName}Fragment
</#if>

<#import "root://activities/MVPArmsTemplate/globals.xml.ftl" as gb>

<@gb.fileHeader />
<#if needActivity && needFragment>
@ActivityScope
<#elseif needActivity>
@ActivityScope
<#elseif needFragment>
@FragmentScope
</#if>
@Component(modules = arrayOf(${pageName}Module::class),dependencies = arrayOf(AppComponent::class))
interface ${pageName}Component {
  <#if needActivity && needFragment>
	fun inject(activity:${pageName}Activity)
	fun inject(fragment:${pageName}Fragment)
  <#elseif needActivity || needFragment>
    fun inject(<#if needFragment>fragment:${pageName}Fragment<#else>activity:${pageName}Activity</#if>)
  </#if>
}
