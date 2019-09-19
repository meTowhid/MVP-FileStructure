package ${fullPackage}.mvp;


import com.shohoz.driver.basemvp.BaseView;
import com.shohoz.driver.databinding.Activity${fileName}Binding;


public interface ${fileName}Contact {

    interface View extends BaseView {
        void bindView(Activity${fileName}Binding binding);

        void onDataResponse(Object data);
    }

    interface Presenter {
        void getInfo();
    }
}
