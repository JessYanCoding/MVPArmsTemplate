package ${packageName}${fragmentPackageName};

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import me.jessyan.art.base.App;
import me.jessyan.art.base.BaseFragment;
import me.jessyan.art.mvp.IView;
import me.jessyan.art.mvp.Message;
import me.jessyan.art.utils.UiUtils;

<#if presenterName?has_content>
import ${packageName}${presenterPackageName}.${presenterName};
</#if>

import ${packageName}.R;


public class ${pageName}Fragment extends BaseFragment <#if presenterName?has_content><${presenterName}></#if> implements IView {


    public static ${pageName}Fragment newInstance() {
        ${pageName}Fragment fragment = new ${pageName}Fragment();
        return fragment;
    }

    @Override
    public View initView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.${fragmentLayoutName}, container, false);
    }

    @Override
    public void initData(Bundle savedInstanceState) {

    }

    @Override
    public <#if presenterName?has_content>${presenterName}<#else>IPresenter</#if> obtainPresenter() {
        return <#if presenterName?has_content> new ${presenterName}(((App) getActivity().getApplication()).getAppComponent())<#else> null</#if>;
    }

     /**
     * 此方法是让外部调用使fragment做一些操作的,比如说外部的activity想让fragment对象执行一些方法,
     * 建议在有多个需要让外界调用的方法时,统一传Message,通过what字段,来区分不同的方法,在setData
     * 方法中就可以switch做不同的操作,这样就可以用统一的入口方法做不同的事
     *
     * 使用此方法时请注意调用时fragment的生命周期,如果调用此setData方法时onCreate还没执行
     * setData里却调用了presenter的方法时,是会报空的,因为presenter是在onCreate方法中创建的
     * 如果要做一些初始化操作,可以不必让外部调setData,在initData中初始化就可以了
     *
     * @param data
     */

    @Override
    public void setData(Object data) {

    }


     @Override
    public void showLoading() {

    }

    @Override
    public void hideLoading() {

    }

    @Override
    public void showMessage(String message) {
        UiUtils.snackbarText(message);
    }


    @Override
    public void handleMessage(Message message) {
        switch (message.what) {
            case 0:
                break;
            case 1:
                break;
        }
    }

}