package ${modelPackageName}

import android.app.Application
import com.google.gson.Gson
import com.jess.arms.integration.IRepositoryManager
import com.jess.arms.mvp.BaseModel

<#if needActivity && needFragment>
import com.jess.arms.di.scope.ActivityScope
<#elseif needActivity>
import com.jess.arms.di.scope.ActivityScope
<#elseif needFragment>
import com.jess.arms.di.scope.FragmentScope
</#if>
import javax.inject.Inject

import ${contractPackageName}.${pageName}Contract


<#if needActivity && needFragment>
@ActivityScope
<#elseif needActivity>
@ActivityScope
<#elseif needFragment>
@FragmentScope
</#if>
class ${pageName}Model
@Inject
constructor(repositoryManager: IRepositoryManager) : BaseModel(repositoryManager), ${pageName}Contract.Model{
    @Inject
    lateinit var mGson:Gson;
    @Inject
    lateinit var mApplication:Application;

    override fun onDestroy() {
          super.onDestroy();
    }
}
