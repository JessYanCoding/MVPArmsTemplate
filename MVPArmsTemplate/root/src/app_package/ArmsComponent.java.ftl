package ${componentPackageName};

import dagger.BindsInstance;
import dagger.Component;
import com.jess.arms.di.component.AppComponent;

import ${moudlePackageName}.${pageName}Module;
import ${contractPackageName}.${pageName}Contract;

<#if needActivity && needFragment>
import com.jess.arms.di.scope.ActivityScope;
import ${ativityPackageName}.${pageName}Activity;
import ${fragmentPackageName}.${pageName}Fragment;
<#elseif needActivity>
import com.jess.arms.di.scope.ActivityScope;
import ${ativityPackageName}.${pageName}Activity;   
<#elseif needFragment>
import com.jess.arms.di.scope.FragmentScope;
import ${fragmentPackageName}.${pageName}Fragment;
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
@Component(modules = ${pageName}Module.class, dependencies = AppComponent.class)
public interface ${pageName}Component {
  <#if needActivity && needFragment>
	void inject(${pageName}Activity activity);
	void inject(${pageName}Fragment fragment);
  <#elseif needActivity || needFragment>
    void inject(<#if needFragment>${pageName}Fragment fragment<#else>${pageName}Activity activity</#if>);
  </#if>
    @Component.Builder
    interface Builder {
        @BindsInstance
        ${pageName}Component.Builder view(${pageName}Contract.View view);
        ${pageName}Component.Builder appComponent(AppComponent appComponent);
        ${pageName}Component build();
    }
}