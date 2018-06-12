package ${presenterPackageName}

import com.jess.arms.di.scope.ActivityScope
import com.jess.arms.mvp.IPresenter
import javax.inject.Inject

/**
 * Author : zhongwenpeng
 * Email : 1340751953@qq.com
 * Time :  2018/6/12
 * Description :
 */
@ActivityScope
class NullObjectPresenterByActivity
@Inject
constructor() : IPresenter {
    override fun onStart() {
    }

    override fun onDestroy() {
    }
}
