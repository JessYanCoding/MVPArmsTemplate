package ${packageName}${ativityPackageName};

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;

import me.jessyan.art.base.BaseActivity;
import me.jessyan.art.mvp.IView;
import me.jessyan.art.mvp.Message;
import me.jessyan.art.utils.ArtUtils;

import static me.jessyan.art.utils.Preconditions.checkNotNull;

<#if presenterName?has_content>
import ${packageName}${presenterPackageName}.${presenterName};
</#if>

import ${packageName}.R;


public class ${pageName}Activity extends BaseActivity <#if presenterName?has_content><${presenterName}></#if> implements IView {

    @Override
    public int initView(@Nullable Bundle savedInstanceState) {
        return R.layout.${activityLayoutName}; //如果你不需要框架帮你设置 setContentView(id) 需要自行设置,请返回 0
    }

    @Override
    public void initData(@Nullable Bundle savedInstanceState) {

    }

    @Override
    @Nullable
    public <#if presenterName?has_content>${presenterName}<#else>IPresenter</#if> obtainPresenter() {
        return <#if presenterName?has_content> new ${presenterName}(ArtUtils.obtainAppComponentFromContext(this))<#else> null</#if>;
    }

    @Override
    public void showLoading() {

    }

    @Override
    public void hideLoading() {

    }

    @Override
    public void showMessage(@NonNull String message) {
        checkNotNull(message);
        ArtUtils.snackbarText(message);
    }

    @Override
    public void handleMessage(@NonNull Message message) {
        checkNotNull(message);
        switch (message.what) {
            case 0:
                break;
            case 1:
                break;
        }
    }
}
