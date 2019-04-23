[#ftl/]
[#-- @ftlvariable name="pushEnabled" type="boolean" --]
[#-- @ftlvariable name="pushPreferred" type="boolean" --]
[#-- @ftlvariable name="systemConfiguration" type="io.fusionauth.domain.SystemConfiguration" --]
[#-- @ftlvariable name="trustComputer" type="boolean" --]
[#-- @ftlvariable name="userCanReceivePush" type="boolean" --]
[#-- @ftlvariable name="version" type="java.lang.String" --]

[#import "../_helpers.ftl" as helpers/]

[@helpers.html]
  [@helpers.head]
    [#-- Custom <head> code goes here --]
    <script src="${request.contextPath}/js/oauth2/TwoFactor.js?version=${version}"></script>
    <script>
      Prime.Document.onReady(function() {
        new FusionAuth.OAuth2.TwoFactor();
      });
    </script>
  [/@helpers.head]
  [@helpers.body]

    [@helpers.header]
      [#-- Custom header code goes here --]
    [/@helpers.header]

    [@helpers.main title="Two factor challenge"]
      [#setting url_escaping_charset='UTF-8']
      <form id="2fa-form" action="two-factor" method="POST" class="full">
        [@helpers.input type="text" name="code" id="code" autocapitalize="none" autocomplete="off" autocorrect="off" label="Authentication code" autofocus=true placeholder="Enter your Verification Code"/]

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
        [@helpers.hidden name="twoFactorId"/]
        [@helpers.hidden name="resendCode" value="false"/]
        <div class="form-row">
          <label>
            <input type="checkbox" name="trustComputer" [#if trustComputer]checked[/#if]/>
            [#assign trustInDays = (systemConfiguration.externalIdentifierConfiguration.twoFactorTrustIdTimeToLiveInSeconds / (24 * 60 * 60))?string("##0")/]
            Trust this computer for ${trustInDays} days
            <i class="fa fa-info-circle" data-tooltip="Do not select this on a public computer. Trusting this computer will allow you to bypass two factor authentication for the configured duration"></i>[#t/]
          </label>
        </div>
        [@helpers.button text="verify"/]
        [#if pushEnabled && userCanReceivePush]
          <a id="resend-2fa" href="#">
            [#if pushPreferred]
              Send another code
            [#else]
              Send a code to your mobile phone
            [/#if]
          </a>
        [/#if]
      </form>
    [/@helpers.main]
  [/@helpers.body]
[/@helpers.html]
