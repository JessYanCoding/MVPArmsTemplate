package ${packageName}${fragmentPackageName};

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.app.Activity;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import me.jessyan.art.base.BaseFragment;
import me.jessyan.art.base.delegate.IFragment;
import me.jessyan.art.mvp.IView;
import me.jessyan.art.mvp.Message;
import me.jessyan.art.utils.ArtUtils;

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
    public View initView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return inflater.inflate(R.layout.${fragmentLayoutName}, container, false);
    }

    @Override
    public void initData(@Nullable Bundle savedInstanceState) {

    }

    @Override
    @Nullable
    public <#if presenterName?has_content>${presenterName}<#else>IPresenter</#if> obtainPresenter() {
        return <#if presenterName?has_content> new ${presenterName}(ArtUtils.obtainAppComponentFromContext(getActivity()))<#else> null</#if>;
    }

    /**
     * 通过此方法可以使 Fragment 能够与外界做一些交互和通信, 比如说外部的 Activity 想让自己持有的某个 Fragment 对象执行一些方法,
     * 建议在有多个需要与外界交互的方法时, 统一传 {@link Message}, 通过 what 字段来区分不同的方法, 在 {@link #setData(Object)}
     * 方法中就可以 {@code switch} 做不同的操作, 这样就可以用统一的入口方法做多个不同的操作, 可以起到分发的作用
     * <p>
     * 调用此方法时请注意调用时 Fragment 的生命周期, 如果调用 {@link #setData(Object)} 方法时 {@link Fragment#onCreate(Bundle)} 还没执行
     * 但在 {@link #setData(Object)} 里却调用了 Presenter 的方法, 是会报空的, 因为 Dagger 注入是在 {@link Fragment#onCreate(Bundle)} 方法中执行的
     * 然后才创建的 Presenter, 如果要做一些初始化操作,可以不必让外部调用 {@link #setData(Object)}, 在 {@link #initData(Bundle)} 中初始化就可以了
     * <p>
     * Example usage:
     * <pre>
     * public void setData(@Nullable Object data) {
     *     if (data != null && data instanceof Message) {
     *         switch (((Message) data).what) {
     *             case 0:
     *                 loadData(((Message) data).arg1);
     *                 break;
     *             case 1:
     *                 refreshUI();
     *                 break;
     *             default:
     *                 //do something
     *                 break;
     *         }
     *     }
     * }
     *
     * // call setData(Object):
     * Message data = new Message();
     * data.what = 0;
     * data.arg1 = 1;
     * fragment.setData(data);
     * </pre>
     *
     * {@link #setData(Object)} 框架是不会调用的, 是拿给开发者自己去调用的, 让 {@link Activity} 或者其他类可以和 {@link Fragment} 通信,
     * 并且因为 {@link #setData(Object)} 是 {@link IFragment} 的方法, 所以你可以通过多态, 持有父类,
     * 不持有具体子类的方式就可以和子类 {@link Fragment} 通信, 这样如果需要替换子类, 就不会影响到其他地方,
     * 并且 {@link #setData(Object)} 可以通过传入 {@link Message} 作为参数, 使外部统一调用 {@link #setData(Object)},
     * 方法内部再通过 {@code switch(message.what)} 的方式, 从而在外部调用方式不变的情况下, 却可以扩展更多的方法,
     * 让方法扩展更多的参数, 这样不管 {@link Fragment} 子类怎么变, 它内部的方法以及方法的参数怎么变, 却不会影响到外部调用的任何一行代码
     *
     * @param data 当不需要参数时 {@code data} 可以为 {@code null}
     */
    @Override
    public void setData(@Nullable Object data) {

    }

     @Override
    public void showLoading() {

    }

    @Override
    public void hideLoading() {

    }

    @Override
    public void showMessage(@NonNull String message) {
        ArtUtils.snackbarText(message);
    }

    @Override
    public void handleMessage(@NonNull Message message) {
        switch (message.what) {
            case 0:
                break;
            case 1:
                break;
        }
    }
}
