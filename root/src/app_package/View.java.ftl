package ${fullPackage}.mvp;

<#if (parentActivityClass?has_content)>
import ${parentActivityClass};
<#else>
import ${fullPackage}.${fileName}Activity;
</#if>
import com.shohoz.driver.BaseAppController;
import ${fullPackage}.di.${fileName}Module;
<#if (initDagger)>
import ${fullPackage}.di.Dagger${fileName}Component;
</#if>
<#--  import com.shohoz.driver.databinding.Activity${fileName}Binding;  -->

import javax.inject.Inject;


public class ${fileName}View implements ${fileName}Contact.View {

<#if (initDagger)>
    @Inject
</#if>
    ${fileName}Presenter presenter;

    private Activity${fileName}Binding mBinding;
    private ${fileName}Activity activity;

    public ${fileName}View(${fileName}Activity activity) {
        this.activity = activity;
<#if (initDagger)>
        Dagger${fileName}Component.builder()
                .appComponent(BaseAppController.getInstance().getAppComponent())
                .${variableName}Module(new ${fileName}Module(activity))
                .build().inject(this);
</#if>
    }

    @Override
    public void onViewInit() {
    }

    @Override
    public void onDataResponse() {
    }

    @Override
    public void bindView(Activity${fileName}Binding mBinding) {
        this.mBinding = mBinding;
        onViewInit();
    }

    @Override
    public void onShowAlert(String message, boolean isError) {/**/}

    @Override
    public void onHideAlert() {/**/}

    @Override
    public void onShowProgress() {/**/}

    @Override
    public void onHideProgress() {/**/}
}
