[#ftl/]
[#-- @ftlvariable name="application" type="io.fusionauth.domain.Application" --]

[#import "../_helpers.ftl" as helpers/]

[@helpers.html]
  [@helpers.head title="Complete Registration | FusionAuth"]
    [#-- Custom <head> code goes here --]
  [/@helpers.head]
  [@helpers.body]
    [@helpers.header]
      [#-- Custom header code goes here --]
    [/@helpers.header]

    [@helpers.main title="Complete Registration"]
      <form action="complete-registration" method="POST" class="full">
        [@helpers.hidden name="client_id"/]
        [@helpers.hidden name="redirect_uri"/]
        [@helpers.hidden name="response_type"/]
        [@helpers.hidden name="scope"/]
        [@helpers.hidden name="state"/]
        [@helpers.hidden name="timezone"/]
        [@helpers.hidden name="metaData.device.name"/]
        [@helpers.hidden name="metaData.device.type"/]
        [@helpers.hidden name="nonce"/]

        <fieldset>
          [#if application.registrationConfiguration.firstName.enabled]
            [@helpers.input type="text" name="user.firstName" id="firstName" placeholder="First name ${application.registrationConfiguration.firstName.required?then('*', '')}" leftAddon="user"/]
          [/#if]
          [#if application.registrationConfiguration.fullName.enabled]
            [@helpers.input type="text" name="user.fullName" id="fullName" placeholder="Full name ${application.registrationConfiguration.fullName.required?then('*', '')}" leftAddon="user"/]
          [/#if]
          [#if application.registrationConfiguration.middleName.enabled]
            [@helpers.input type="text" name="user.middleName" id="middleName" placeholder="Middle name ${application.registrationConfiguration.middleName.required?then('*', '')}" leftAddon="user"/]
          [/#if]
          [#if application.registrationConfiguration.lastName.enabled]
            [@helpers.input type="text" name="user.lastName" id="lastName" placeholder="Last name ${application.registrationConfiguration.lastName.required?then('*', '')}" leftAddon="user"/]
          [/#if]
          [#if application.registrationConfiguration.birthDate.enabled]
            [@helpers.input type="text" name="user.birthDate" id="birthDate" placeholder="Birthdate ${application.registrationConfiguration.birthDate.required?then('*', '')}" leftAddon="calendar" class="date-picker" dateTimeFormat="yyyy-MM-dd"/]
          [/#if]
          [#if application.registrationConfiguration.mobilePhone.enabled]
            [@helpers.input type="text" name="user.mobilePhone" id="mobilePhone" placeholder="Phone ${application.registrationConfiguration.mobilePhone.required?then('*', '')}" leftAddon="phone"/]
          [/#if]
        </fieldset>

        <div class="form-row">
          [@helpers.button icon="key" text="Submit"/]
        </div>
      </form>
    [/@helpers.main]

    [@helpers.footer]
      [#-- Custom footer code goes here --]
    [/@helpers.footer]
  [/@helpers.body]
[/@helpers.html]
