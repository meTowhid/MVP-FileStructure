package ${fullPackage}.mvp;


import com.shohoz.driver.basemvp.BaseView;
<#--  import com.shohoz.driver.databinding.Activity${fileName}Binding;  -->


public interface ${fileName}Contact {

    interface View extends BaseView {
        void bindView(Activity${fileName}Binding mBind);

        void onDataResponse();
    }

    interface Presenter {
        void getInfo();
    }
}
