package ${fullPackage};

import android.content.Context;
import android.os.Bundle;

import androidx.databinding.DataBindingUtil;

import com.shohoz.driver.BaseAppController;
import com.shohoz.driver.R;
import com.shohoz.driver.activity.BaseActivity;
<#if (initDagger)>
import ${fullPackage}.di.Dagger${fileName}Component;
import ${fullPackage}.di.${fileName}Module;
</#if>
import ${fullPackage}.mvp.${fileName}View;
<#--  import com.shohoz.driver.databinding.Activity${fileName}Binding;  -->
import com.shohoz.driver.helper.LocaleManager;

import javax.inject.Inject;

public class ${fileName}Activity extends BaseActivity {

<#if (initDagger)>
    @Inject
</#if>
    public ${fileName}View view;
    public Activity${fileName}Binding mBinding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        mBinding = DataBindingUtil.setContentView(this, R.layout.activity_edit_account);

    <#if (initDagger)>  
        Dagger${fileName}Component.builder()
                .appComponent(BaseAppController.getInstance().getAppComponent())
                .${variableName}Module(new ${fileName}Module(this))
                .build().inject(this);
    </#if>
        view.bindView(mBinding);
        initiateUI();
    }

    @Override
    protected void initiateUI() {
    }

    @Override
    protected void setListeners() {
    }

    @Override
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(LocaleManager.onAttach(base));
    }
}