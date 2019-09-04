package ${fullPackage}.mvp;

<#if (parentActivityClass)??>
import ${parentActivityClass};
</#if>
<#--  import com.shohoz.driver.activity.${fileName}Activity;  -->
import com.shohoz.driver.retrofit.ApiInterface;
import com.shohoz.driver.utilities.NetworkUtils;

import io.reactivex.Observable;
import retrofit2.Response;

public class ${fileName}Model {
    private ${fileName}Activity ${variableName}Activity;
    private ApiInterface apiInterface;

    public ${fileName}Model(${fileName}Activity ${variableName}Activity, ApiInterface apiInterface) {
        this.${variableName}Activity = ${variableName}Activity;
        this.apiInterface = apiInterface;
    }

    Observable<Boolean> isNetworkAvailable() {
        return NetworkUtils.isNetworkAvailableObservable(${variableName}Activity);
    }

    Observable<Response<DummyData>> getInfo() {
        return apiInterface.getDummyInfo();
    }
}
