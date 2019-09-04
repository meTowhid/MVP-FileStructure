<?xml version="1.0"?>
<recipe>
  <#assign dir = "${escapeXmlAttribute(srcOut)}/${variableName}" />

<#if (initDagger)>
  <instantiate from="src/app_package/Component.java.ftl" to="${dir}/di/${fileName}Component.java" />
  <instantiate from="src/app_package/Module.java.ftl" to="${dir}/di/${fileName}Module.java" />
  <instantiate from="src/app_package/Scope.java.ftl" to="${dir}/di/${fileName}Scope.java" />
</#if>

<#if (newActivity)>
  <instantiate from="src/app_package/Activity.java.ftl" to="${dir}/${fileName}Activity.java" />
</#if>

  <instantiate from="src/app_package/Contact.java.ftl" to="${dir}/mvp/${fileName}Contact.java" />
  <instantiate from="src/app_package/Model.java.ftl" to="${dir}/mvp/${fileName}Model.java" />
  <instantiate from="src/app_package/Presenter.java.ftl" to="${dir}/mvp/${fileName}Presenter.java" />
  <instantiate from="src/app_package/View.java.ftl" to="${dir}/mvp/${fileName}View.java" />

  <open file="${dir}/mvp/${fileName}Presenter.java" />
  <open file="${dir}/mvp/${fileName}View.java" />
  <open file="${dir}/di/${fileName}Component.java" />
  
<#if (newActivity)>
  <open file="${dir}/${fileName}Activity.java" />
</#if>
</recipe>