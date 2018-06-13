package ${packageName}${presenterPackageName}

import me.jessyan.art.di.component.AppComponent
import me.jessyan.art.mvp.BasePresenter
import me.jessyan.rxerrorhandler.core.RxErrorHandler

<#if modelName?has_content>
import ${packageName}${modelPackageName}.${modelName}
</#if>


class ${presenterName}(appComponent:AppComponent) :
BasePresenter <#if modelName?has_content><${modelName}></#if>(<#if modelName?has_content>appComponent.repositoryManager().createRepository(${modelName}::class.java)<#else></#if>) {
    private val mErrorHandler by lazy{
        appComponent.rxErrorHandler()
    }



    override fun onDestroy() {
        super.onDestroy()
    }
}
