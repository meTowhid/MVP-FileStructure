package ${fullPackage}.mvp;

<#if (parentActivityClass?has_content)>
import ${parentActivityClass};
<#else>
import ${fullPackage}.${fileName}Activity;
</#if>
import com.shohoz.driver.helper.CustomDialog;
import com.shohoz.driver.BaseAppController;
import ${fullPackage}.di.${fileName}Module;
<#if (initDagger)>
import ${fullPackage}.di.Dagger${fileName}Component;
</#if>
import com.shohoz.driver.databinding.Activity${fileName}Binding;

import javax.inject.Inject;


public class ${fileName}View implements ${fileName}Contact.View {

    /* ------ Activity Code ------
    @Inject
    public ${fileName}View view;
    Dagger${fileName}Component.builder()
            .appComponent(BaseAppController.getInstance().getAppComponent())
            .${variableName}Module(new ${fileName}Module(this))
            .build().inject(this);

    view.bindView(binding);
    */

<#if (initDagger)>
    @Inject
</#if>
    ${fileName}Presenter presenter;

    private Activity${fileName}Binding binding;
    private ${fileName}Activity activity;
    private CustomDialog progressDialog;

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
        presenter.getInfo();
     }

    @Override
    public void onDataResponse(Object data) {
    }

    @Override
    public void bindView(Activity${fileName}Binding binding) {
        this.binding = binding;
        onViewInit();
    }

    @Override
    public void onShowAlert(String message, boolean isError) {/**/}

    @Override
    public void onHideAlert() {/**/}

    @Override
    public void onShowProgress() {
        progressDialog = new CustomDialog(activity);
        progressDialog.setCanceledOnTouchOutside(false);
        if (!activity.isFinishing()) progressDialog.show();
    }

    @Override
    public void onHideProgress() {
        try {
            if (progressDialog != null && progressDialog.isShowing()) progressDialog.dismiss();
        } catch (Exception e) {
            e.getStackTrace();
        }
    }
}
