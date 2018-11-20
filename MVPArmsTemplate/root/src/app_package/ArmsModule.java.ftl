package ${moudlePackageName};

<#if needActivity && needFragment>
import com.jess.arms.di.scope.ActivityScope;
<#elseif needActivity>
import com.jess.arms.di.scope.ActivityScope;
<#elseif needFragment>
import com.jess.arms.di.scope.FragmentScope;
</#if>

import dagger.Module;
import dagger.Provides;

import ${contractPackageName}.${pageName}Contract;
import ${modelPackageName}.${pageName}Model;


@Module
public class ${pageName}Module {

    <#if needActivity && needFragment>
    @ActivityScope
    <#elseif needActivity>
    @ActivityScope
    <#elseif needFragment>
    @FragmentScope
    </#if>
    @Provides
    ${pageName}Contract.Model provide${pageName}Model(${pageName}Model model){
        return model;
    }
}