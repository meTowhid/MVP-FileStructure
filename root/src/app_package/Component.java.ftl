package ${fullPackage}.di;

<#if (parentActivityClass?has_content)>
import ${parentActivityClass};
<#else>
import ${fullPackage}.${fileName}Activity;
</#if>
import ${fullPackage}.mvp.${fileName}Presenter;
import ${fullPackage}.mvp.${fileName}View;
import com.shohoz.driver.di.component.AppComponent;

import dagger.Component;

@${fileName}Scope
@Component(dependencies = {AppComponent.class}, modules = {${fileName}Module.class})
public interface ${fileName}Component {
    void inject(${fileName}Activity ${variableName}Activity);

    void inject(${fileName}View ${variableName}View);

    void inject(${fileName}Presenter ${variableName}Presenter);
}