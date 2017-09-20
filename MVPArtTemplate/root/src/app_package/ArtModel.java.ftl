package ${packageName}${modelPackageName};

import me.jessyan.art.mvp.IModel;
import me.jessyan.art.mvp.IRepositoryManager;

/**
 * 必须实现 IModel
 * 可以根据不同的业务逻辑划分多个 Repository 类,多个业务逻辑相近的页面可以使用同一个 Repository 类
 * 无需每个页面都创建一个独立的 Repository
 * 通过 {@link me.jessyan.art.mvp.IRepositoryManager#createRepository(java.lang.Class)} 获得的 Repository 实例,为单例对象
 */

public class ${modelName} implements IModel {

    private IRepositoryManager mManager;

    public ${modelName}(IRepositoryManager manager) {
        this.mManager = manager;
    }

    @Override
    public void onDestroy() {
        
    }

}
