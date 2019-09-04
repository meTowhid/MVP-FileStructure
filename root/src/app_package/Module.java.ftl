package ${fullPackage}.di;

<#if (parentActivityClass)??>
import ${parentActivityClass};
</#if>
import ${fullPackage}.mvp.${fileName}Model;
import ${fullPackage}.mvp.${fileName}Presenter;
import ${fullPackage}.mvp.${fileName}View;
import com.shohoz.driver.retrofit.ApiInterface;
import com.shohoz.driver.rx.RxSchedulers;

import dagger.Module;
import dagger.Provides;
import io.reactivex.disposables.CompositeDisposable;


@Module
public class ${fileName}Module {
    private ${fileName}Activity ${variableName}Activity;

    public ${fileName}Module(${fileName}Activity ${variableName}Activity) {
        this.${variableName}Activity = ${variableName}Activity;
    }

    @${fileName}Scope
    @Provides
    ${fileName}View provideView() {
        return new ${fileName}View(${variableName}Activity);
    }

    @${fileName}Scope
    @Provides
    ${fileName}Presenter providePresenter(RxSchedulers schedulers, ${fileName}Model model) {
        CompositeDisposable compositeDisposable = new CompositeDisposable();
        return new ${fileName}Presenter(${variableName}Activity, schedulers, model, compositeDisposable);
    }

    @${fileName}Scope
    @Provides
    ${fileName}Activity provideContext() {
        return ${variableName}Activity;
    }

    @${fileName}Scope
    @Provides
    ${fileName}Model provideModel(ApiInterface apiInterface) {
        return new ${fileName}Model(${variableName}Activity, apiInterface);
    }
}
