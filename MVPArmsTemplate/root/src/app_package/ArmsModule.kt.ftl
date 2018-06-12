package ${moudlePackageName}

<#if needActivity && needFragment>
import com.jess.arms.di.scope.ActivityScope
<#elseif needActivity>
import com.jess.arms.di.scope.ActivityScope
<#elseif needFragment>
import com.jess.arms.di.scope.FragmentScope
</#if>

import dagger.Module
import dagger.Provides

import ${contractPackageName}.${pageName}Contract
import ${modelPackageName}.${pageName}Model


@Module
 //构建${pageName}Module时,将View的实现类传进来,这样就可以提供View的实现类给presenter
class ${pageName}Module(private val view:${pageName}Contract.View) {
    <#if needActivity && needFragment>
    @ActivityScope
    <#elseif needActivity>
    @ActivityScope
    <#elseif needFragment>
    @FragmentScope
    </#if>
    @Provides
    fun provide${pageName}View():${pageName}Contract.View{
        return this.view
    }

    <#if needActivity && needFragment>
    @ActivityScope
    <#elseif needActivity>
    @ActivityScope
    <#elseif needFragment>
    @FragmentScope
    </#if>
    @Provides
    fun provide${pageName}Model(model:${pageName}Model):${pageName}Contract.Model{
        return model
    }
}
