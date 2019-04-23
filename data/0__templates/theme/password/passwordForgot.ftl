[#ftl/]
[#import "../_helpers.ftl" as helpers/]

[@helpers.html]
  [@helpers.head]
    [#-- Custom <head> code goes here --]
  [/@helpers.head]
  [@helpers.body]
    [@helpers.header]
      [#-- Custom header code goes here --]
    [/@helpers.header]

    [@helpers.main title="Forgot password"]
      <form action="forgot" method="POST" class="full">
        [@helpers.hidden name="tenantId"/]
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
        <p>
          Forgot your password? Type in your email address in the form below to reset your password.
        </p>
        <fieldset class="push-less-top">
          [@helpers.input type="text" name="email" id="email" autocapitalize="none" autofocus=true autocomplete="on" autocorrect="off" placeholder="Email" leftAddon="user"/]
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
