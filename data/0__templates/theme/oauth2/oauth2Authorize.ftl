[#ftl/]
[#-- @ftlvariable name="client_id" type="java.lang.String" --]
[#-- @ftlvariable name="hasDomainBasedIdentityProviders" type="boolean" --]
[#-- @ftlvariable name="identityProviders" type="java.util.Map<java.lang.String, java.util.List<io.fusionauth.domain.provider.BaseIdentityProvider<?>>>" --]
[#-- @ftlvariable name="loginId" type="java.lang.String" --]
[#-- @ftlvariable name="passwordlessEnabled" type="boolean" --]
[#-- @ftlvariable name="redirect_uri" type="java.lang.String" --]
[#-- @ftlvariable name="response_type" type="java.lang.String" --]
[#-- @ftlvariable name="scope" type="java.lang.String" --]
[#-- @ftlvariable name="showPasswordField" type="boolean" --]
[#-- @ftlvariable name="state" type="java.lang.String" --]
[#-- @ftlvariable name="version" type="java.lang.String" --]

[#import "../_helpers.ftl" as helpers/]

[@helpers.html]
  [@helpers.head]
    <script src="/js/jstz-min-1.0.4.js"></script>
    <script src="/js/fingerprint2.min-1.5.1.js"></script>
    <script src="/js/oauth2/Authorize.js?version=${version}"></script>
    [@helpers.alternativeLoginsScript clientId=client_id identityProviders=identityProviders/]
    <script>
      Prime.Document.onReady(function() {
        // This object handles guessing the timezone and filling in the device id of the user
        new FusionAuth.OAuth2.Authorize();
      });
    </script>
  [/@helpers.head]
  [@helpers.body]

    [@helpers.header]
      [#-- Custom header code goes here --]
    [/@helpers.header]

    [@helpers.main]
      <form action="authorize" method="POST" class="full">
        [@helpers.hidden name="client_id"/]
        [@helpers.hidden name="redirect_uri"/]
        [@helpers.hidden name="response_type"/]
        [@helpers.hidden name="scope"/]
        [@helpers.hidden name="state"/]
        [@helpers.hidden name="timezone"/]
        [@helpers.hidden name="metaData.device.name"/]
        [@helpers.hidden name="metaData.device.type"/]
        [@helpers.hidden name="nonce"/]
        [@helpers.hidden name="showPasswordField"/]
        [#if showPasswordField && hasDomainBasedIdentityProviders]
          [@helpers.hidden name="loginId"/]
        [/#if]

        <fieldset>
          [@helpers.input type="text" name="loginId" id="loginId" autocomplete="username" autocapitalize="none" autocomplete="on" autocorrect="off" spellcheck="false" autofocus=(!loginId?has_content) placeholder="Email" leftAddon="user" disabled=(showPasswordField && hasDomainBasedIdentityProviders)/]
          [#if showPasswordField]
            [@helpers.input type="password" name="password" id="password" autocomplete="current-password" autofocus=loginId?has_content placeholder="Password" leftAddon="lock"/]
          [/#if]
        </fieldset>

        <div class="form-row">
          [#if showPasswordField]
            [@helpers.button icon="key" text="Submit"/]
            <a href="/password/forgot?tenantId=${tenantId!''}&client_id=${client_id!''}&nonce=${nonce!''}&redirect_uri=${redirect_uri!''}&response_type=${response_type!''}&scope=${scope!''}&state=${state!''}&timezone=${timezone!''}&metaData.device.name=${(metaData.device.name)!''}&metaData.device.type=${(metaData.device.type)!''}">
              Forgot your password?
            </a>
          [#else]
            [@helpers.button icon="arrow-right" text="Next"/]
          [/#if]
        </div>
      </form>
      <div>
        [#if showPasswordField && hasDomainBasedIdentityProviders]
          <a href="?client_id=${client_id!''}&redirect_uri=${redirect_uri!''}&nonce=${nonce!''}&response_type=${response_type!''}&scope=${scope!''}&state=${state!''}&showPasswordField=false">Sign in as a different user</a>
        [/#if]
      </div>
      [#if application.registrationConfiguration.enabled]
        <div class="form-row push-top">
          Don't have an account?
          <a href="register?client_id=${client_id!''}&nonce=${nonce!''}&redirect_uri=${redirect_uri!''}&response_type=${response_type!''}&scope=${scope!''}&state=${state!''}&timezone=${timezone!''}&metaData.device.name=${(metaData.device.name)!''}&metaData.device.type=${(metaData.device.type)!''}">
             Create an account
          </a>
        </div>
      [/#if]
      [@helpers.alternativeLogins clientId=client_id identityProviders=identityProviders passwordlessEnabled=passwordlessEnabled/]
    [/@helpers.main]

    [@helpers.footer]
      [#-- Custom footer code goes here --]
    [/@helpers.footer]

  [/@helpers.body]
[/@helpers.html]
