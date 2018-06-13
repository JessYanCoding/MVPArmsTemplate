package ${packageName}${ativityPackageName}

import android.os.Bundle

import me.jessyan.art.base.BaseActivity
import me.jessyan.art.mvp.IView
import me.jessyan.art.mvp.Message
import me.jessyan.art.utils.ArtUtils


<#if presenterName?has_content>
import ${packageName}${presenterPackageName}.${presenterName};
</#if>

import ${packageName}.R;


class ${pageName}Activity : BaseActivity <#if presenterName?has_content><${presenterName}>()</#if> , IView {

    override fun initView(savedInstanceState:Bundle?):Int {
           return R.layout.${activityLayoutName} //如果你不需要框架帮你设置 setContentView(id) 需要自行设置,请返回 0
    }


    override fun initData(savedInstanceState:Bundle?) {

    }

    override fun obtainPresenter(): MainPresenter? {
       return MainPresenter(ArtUtils.obtainAppComponentFromContext(this))
    }

    override fun showLoading() {

    }

    override fun hideLoading() {

    }

    override fun showMessage(message:String) {
        ArtUtils.snackbarText(message)
    }

    override fun handleMessage(message:Message) {
         when (message.what) {
             0 -> {
                 //根据what 做你想做的事情
             }
             else -> {
             }
         }
     }
}
