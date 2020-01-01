package ${fullPackage}.mvp;

<#if (parentActivityClass?has_content)>
import ${parentActivityClass};
<#else>
import ${fullPackage}.${fileName}Activity;
</#if>
import com.shohoz.driver.retrofit.RideApiInterface;
import com.shohoz.driver.utilities.NetworkUtils;

import io.reactivex.Observable;
import retrofit2.Response;

public class ${fileName}Model {
    private ${fileName}Activity ${variableName}Activity;
    private RideApiInterface apiInterface;

    public ${fileName}Model(${fileName}Activity ${variableName}Activity, RideApiInterface apiInterface) {
        this.${variableName}Activity = ${variableName}Activity;
        this.apiInterface = apiInterface;
    }

    Observable<Boolean> isNetworkAvailable() {
        return NetworkUtils.isNetworkAvailableObservable(${variableName}Activity);
    }

    Observable<Response<?>> getInfo() {
        return null;  //apiInterface.getDummyInfo();
    }
}
