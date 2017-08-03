package ${packageName}${presenterPackageName};

import me.jessyan.art.di.component.AppComponent;
import me.jessyan.art.mvp.BasePresenter;
import me.jessyan.rxerrorhandler.core.RxErrorHandler;

<#if modelName?has_content>
import ${packageName}${modelPackageName}.${modelName};
</#if>


public class ${presenterName} extends BasePresenter <#if modelName?has_content><${modelName}></#if> {
    private RxErrorHandler mErrorHandler;
    
    public ${presenterName}(AppComponent appComponent) {
        <#if modelName?has_content>super(appComponent.repositoryManager().createRepository(${modelName}.class))<#else>super()</#if>;
        this.mErrorHandler = appComponent.rxErrorHandler();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        this.mErrorHandler = null;
    }

}