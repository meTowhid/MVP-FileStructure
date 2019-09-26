package ${fullPackage}.mvp;

<#if (parentActivityClass?has_content)>
import ${parentActivityClass};
<#else>
import ${fullPackage}.${fileName}Activity;
</#if>
import com.shohoz.driver.helper.CLog;
import com.shohoz.driver.rx.RxSchedulers;
import com.shohoz.driver.utilities.Utilities;

import io.reactivex.disposables.CompositeDisposable;


public class ${fileName}Presenter implements ${fileName}Contact.Presenter {
    <#--  private static final String TAG = "${fileName}Presenter";  -->
    private CompositeDisposable compositeDisposable;
    private ${fileName}Activity activity;
    private RxSchedulers schedulers;
    private ${fileName}Model model;

    public ${fileName}Presenter(${fileName}Activity activity, RxSchedulers schedulers, ${fileName}Model model, CompositeDisposable compositeDisposable) {
        this.activity = activity;
        this.schedulers = schedulers;
        this.model = model;
        this.compositeDisposable = compositeDisposable;
    }

    @Override
    public void getInfo() {
        activity.view.onShowProgress();
        compositeDisposable.add(model.isNetworkAvailable().doOnNext(isNetAvailable -> {
        }).filter(isNetAvailable -> true)
                .flatMap(isNetAvailable -> model.getInfo())
                .subscribeOn(schedulers.io())
                .observeOn(schedulers.androidThread())
                .subscribe(response -> {
                    activity.view.onHideProgress();
                    if (response.isSuccessful() && response.body() != null) {
                        activity.view.onResponse(response.body());
                    } else activity.handleErrorResponse(response);
                }, t -> {
                    activity.view.onHideProgress();
                    activity.handleThrowable(t);
                }));
    }
}
