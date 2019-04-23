[#ftl/]
[#-- @ftlvariable name="passwordValidationRules" type="io.fusionauth.domain.PasswordValidationRules" --]

[#import "../_helpers.ftl" as helpers/]

[@helpers.html]
  [@helpers.head]
    [#-- Custom <head> code goes here --]
  [/@helpers.head]
  [@helpers.body]
    [@helpers.header]
      [#-- Custom header code goes here --]
    [/@helpers.header]

    [@helpers.main title="Update your password"]
      <form action="change" method="POST" class="full">
        [#if passwordValidationRules??]
          [@helpers.passwordRules passwordValidationRules/]
        [/#if]
        <fieldset>
          [@helpers.hidden name="client_id"/]
          [@helpers.hidden name="redirect_uri"/]
          [@helpers.hidden name="response_type"/]
          [@helpers.hidden name="grant_type"/]
          [@helpers.hidden name="scope"/]
          [@helpers.hidden name="state"/]
          [@helpers.hidden name="timezone"/]
          [@helpers.hidden name="metaData.device.name"/]
          [@helpers.hidden name="metaData.device.type"/]
          [@helpers.hidden name="nonce"/]

          [@helpers.hidden name="changePasswordId"/]
          [@helpers.input type="password" name="password" autocomplete="new-password" id="password" placeholder="New password" leftAddon="lock" autofocus=true/]
          [@helpers.input type="password" name="passwordConfirm" autocomplete="new-password" id="passwordConfirm" placeholder="Re-type new password" leftAddon="lock"/]
        </fieldset>
        <div class="form-row">
          [@helpers.button/]
        </div>
      </form>
    [/@helpers.main]

    [@helpers.footer]
      [#-- Custom footer code goes here --]
    [/@helpers.footer]
  [/@helpers.body]
[/@helpers.html]
