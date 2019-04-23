[#-- Below are the main blocks for all of the themeable pages --]
[#-- @ftlvariable name="application" type="io.fusionauth.domain.Application" --]
[#-- @ftlvariable name="loginTheme" type="io.fusionauth.domain.SystemConfiguration.UIConfiguration.LoginTheme" --]
[#-- @ftlvariable name="version" type="java.lang.String" --]

[#macro html]
<!DOCTYPE html>
<html lang="en">
  [#nested/]
</html>
[/#macro]

[#macro head title="Login | FusionAuth" author="FusionAuth" description="User Management Redefined. A Single Sign-On solution for your entire enterprise."]
<head>
  <title>${title}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="application-name" content="FusionAuth">
  <meta name="author" content="FusionAuth">
  <meta name="description" content="${description}">
  <meta name="robots" content="index, follow">

  [#-- Favicon Madness --]
  <link rel="apple-touch-icon-precomposed" sizes="57x57" href="/images/apple-touch-icon-57x57.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/images/apple-touch-icon-114x114.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/images/apple-touch-icon-72x72.png" />
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/images/apple-touch-icon-144x144.png" />
  <link rel="apple-touch-icon-precomposed" sizes="60x60" href="/images/apple-touch-icon-60x60.png" />
  <link rel="apple-touch-icon-precomposed" sizes="120x120" href="/images/apple-touch-icon-120x120.png" />
  <link rel="apple-touch-icon-precomposed" sizes="128x128" href="/images/apple-touch-icon-120x120.png" />
  <link rel="apple-touch-icon-precomposed" sizes="76x76" href="/images/apple-touch-icon-76x76.png" />
  <link rel="apple-touch-icon-precomposed" sizes="152x152" href="/images/apple-touch-icon-152x152.png" />

  <link rel="icon" type="image/png" href="/images/favicon-196x196.png" sizes="196x196" />
  <link rel="icon" type="image/png" href="/images/favicon-128.png" sizes="128x128" />
  <link rel="icon" type="image/png" href="/images/favicon-96x96.png" sizes="96x96" />
  <link rel="icon" type="image/png" href="/images/favicon-32x32.png" sizes="32x32" />
  <link rel="icon" type="image/png" href="/images/favicon-16x16.png" sizes="16x16" />

  <meta name="msapplication-TileColor" content="#FFFFFF" />
  <meta name="msapplication-TileImage" content="/images/mstile-144x144.png" />
  <meta name="msapplication-square70x70logo" content="/images/mstile-70x70.png" />
  <meta name="msapplication-square150x150logo" content="/images/mstile-150x150.png" />
  <meta name="msapplication-wide310x150logo" content="/images/mstile-310x150.png" />
  <meta name="msapplication-square310x310logo" content="/images/mstile-310x310.png" />

  <link rel="stylesheet" href="/css/font-awesome-4.7.0.min.css"/>
  <link rel="stylesheet" href="/css/inversoft-style-0.1.26.css"/>
  <link rel="stylesheet" href="/css/fusionauth-style.css?version=${version}"/>

  [#if loginTheme?has_content && loginTheme.enabled && loginTheme.stylesheet?has_content]
  <style>
      ${loginTheme.stylesheet}
  </style>
  [/#if]

  <script src="/js/prime-min-1.4.1.js?version=${version}"></script>
  <script>
    "use strict";
    Prime.Document.onReady(function() {
      Prime.Document.query('.alert').each(function(e) {
        var dismissButton = e.queryFirst('a.dismiss-button');
        if (dismissButton !== null) {
          new Prime.Widgets.Dismissable(e, dismissButton).initialize();
        }
      });
      Prime.Document.query('[data-tooltip]').each(function(e) {
        new Prime.Widgets.Tooltip(e).withClassName('tooltip').initialize();
      });
      Prime.Document.query('.date-picker').each(function(e) {
        new Prime.Widgets.DateTimePicker(e).withDateOnly().initialize();
      });
    });
  </script>

  [#-- The nested, page-specific head HTML goes here --]
  [#nested/]

</head>
[/#macro]

[#macro body]
<body class="app-sidebar-closed">
<main>
  [#nested/]
</main>
</body>
[/#macro]

[#macro header]
  <header class="app-header">
    <div class="right-menu">
      <nav>
        <ul>
          <li class="help"><a target="_blank" href="https://fusionauth.io/docs"><i class="fa fa-question-circle-o"></i> Help</a></li>
        </ul>
      </nav>
    </div>
  </header>

  [#nested/]
[/#macro]

[#macro alternativeLoginsScript clientId identityProviders]
  [#if identityProviders["Facebook"]?has_content]
    <script src="https://connect.facebook.net/en_US/sdk.js"></script>
    <script src="/js/identityProvider/Facebook.js?version=${version}" data-app-id="${identityProviders["Facebook"][0].lookupAppId(clientId)}"></script>
  [/#if]
  [#if identityProviders["Google"]?has_content]
    <script src="https://apis.google.com/js/api:client.js"></script>
    <script src="/js/identityProvider/Google.js?version=${version}" data-client-id="${identityProviders["Google"][0].lookupClientId(clientId)}"></script>
  [/#if]
  [#if identityProviders["Twitter"]?has_content]
    [#-- This is the FusionAuth clientId --]
    <script src="/js/identityProvider/Twitter.js?version=${version}" data-client-id="${clientId}"></script>
  [/#if]
  [#if identityProviders["OpenIDConnect"]?has_content]
    <script src="/js/identityProvider/OpenIdConnect.js?version=${version}"></script>
  [/#if]
[/#macro]

[#macro main title="Login"]
<main class="page-body container">
  [@printErrorAlerts/]
  [@printInfoAlerts/]
  <div class="row center-xs">
    <div class="col-xs col-sm-8 col-md-6 col-lg-5 col-xl-4">
      <div class="panel">
        [#if title != ""]
          <h2>${title}</h2>
        [/#if]
        <main>
          [#nested/]
        </main>
      </div>
    </div>
  </div>
</main>
[/#macro]

[#macro footer]
  [#nested/]
[/#macro]

#-- Below are the social login buttons and helpers --]
[#macro facebookButton identityProvider clientId]
 <button id="facebook-login-button" class="facebook login-button" data-permissions="${identityProvider.lookupPermissions(clientId)!''}">
   <div>
     <div class="icon">
       <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 216 216">
         <path class="cls-1" d="M204.1 0H11.9C5.3 0 0 5.3 0 11.9v192.2c0 6.6 5.3 11.9 11.9 11.9h103.5v-83.6H87.2V99.8h28.1v-24c0-27.9 17-43.1 41.9-43.1 11.9 0 22.2.9 25.2 1.3v29.2h-17.3c-13.5 0-16.2 6.4-16.2 15.9v20.8h32.3l-4.2 32.6h-28V216h55c6.6 0 11.9-5.3 11.9-11.9V11.9C216 5.3 210.7 0 204.1 0z"></path>
       </svg>
     </div>
     <div class="text">${identityProvider.lookupButtonText(clientId)?trim}</div>
   </div>
 </button>
[/#macro]

[#macro googleButton identityProvider clientId]
 <button id="google-login-button" class="google login-button" data-scope="${identityProvider.lookupScope(clientId)!''}">
   <div>
     <div class="icon">
       <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48">
         <g>
           <path class="cls-1" d="M24 9.5c3.54 0 6.71 1.22 9.21 3.6l6.85-6.85C35.9 2.38 30.47 0 24 0 14.62 0 6.51 5.38 2.56 13.22l7.98 6.19C12.43 13.72 17.74 9.5 24 9.5z"></path>
           <path class="cls-2" d="M46.98 24.55c0-1.57-.15-3.09-.38-4.55H24v9.02h12.94c-.58 2.96-2.26 5.48-4.78 7.18l7.73 6c4.51-4.18 7.09-10.36 7.09-17.65z"></path>
           <path class="cls-3" d="M10.53 28.59c-.48-1.45-.76-2.99-.76-4.59s.27-3.14.76-4.59l-7.98-6.19C.92 16.46 0 20.12 0 24c0 3.88.92 7.54 2.56 10.78l7.97-6.19z"></path>
           <path class="cls-4" d="M24 48c6.48 0 11.93-2.13 15.89-5.81l-7.73-6c-2.15 1.45-4.92 2.3-8.16 2.3-6.26 0-11.57-4.22-13.47-9.91l-7.98 6.19C6.51 42.62 14.62 48 24 48z"></path>
           <path class="cls-5" d="M0 0h48v48H0z"></path>
         </g>
       </svg>
     </div>
     <div class="text">${identityProvider.lookupButtonText(clientId)?trim}</div>
   </div>
 </button>
[/#macro]

[#macro twitterButton identityProvider clientId]
 <button id="twitter-login-button" class="twitter login-button">
   <div>
     <div class="icon">
       <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 400">
         <g>
           <rect class="cls-1" width="400" height="400"></rect>
         </g>
         <g>
           <path class="cls-2" d="M153.62,301.59c94.34,0,145.94-78.16,145.94-145.94,0-2.22,0-4.43-.15-6.63A104.36,104.36,0,0,0,325,122.47a102.38,102.38,0,0,1-29.46,8.07,51.47,51.47,0,0,0,22.55-28.37,102.79,102.79,0,0,1-32.57,12.45,51.34,51.34,0,0,0-87.41,46.78A145.62,145.62,0,0,1,92.4,107.81a51.33,51.33,0,0,0,15.88,68.47A50.91,50.91,0,0,1,85,169.86c0,.21,0,.43,0,.65a51.31,51.31,0,0,0,41.15,50.28,51.21,51.21,0,0,1-23.16.88,51.35,51.35,0,0,0,47.92,35.62,102.92,102.92,0,0,1-63.7,22A104.41,104.41,0,0,1,75,278.55a145.21,145.21,0,0,0,78.62,23"></path>
           <rect class="cls-3" width="400" height="400"></rect>
         </g>
       </svg>
     </div>
     <div class="text">${identityProvider.lookupButtonText(clientId)?trim}</div>
   </div>
 </button>
[/#macro]

[#macro openIDConnectButton identityProvider clientId]
 <button class="openid login-button" data-identity-provider-id="${identityProvider.id}">
   <div>
     <div class="icon">
       [#if identityProvider.lookupButtonImageURL(clientId)?has_content]
         <img src="${identityProvider.lookupButtonImageURL(clientId)}" title="OpenID Connect Logo" alt="OpenID Connect Logo"/>
       [#else]
         <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">
           <g id="g2189">
             <g id="g2202">
               <path class="cls-1" d="M87.57,39.57c-8.9-5.55-21.38-9-34.95-9C25.18,30.59,3,44.31,3,61.17,3,76.64,21.46,89.34,45.46,91.52v-8.9c-16.12-2-28.24-10.87-28.24-21.45,0-12,15.84-21.9,35.4-21.9,9.78,0,18.6,2.41,24.95,6.43l-9,5.62H96.84V33.8Z"></path>
               <path class="cls-2" d="M45.46,15.41v76l14.23-8.9V6.22Z"></path>
             </g>
           </g>
         </svg>
       [/#if]
     </div>
     <div class="text">${identityProvider.lookupButtonText(clientId)?trim}</div>
   </div>
 </button>
[/#macro]

[#macro alternativeLogins clientId identityProviders passwordlessEnabled]
  [#if identityProviders?has_content || passwordlessEnabled]
    <div class="login-button-container">
      <div class="hr-container">
        <hr>
        <div>or</div>
      </div>

      [#if passwordlessEnabled]
      <div class="form-row push-less-top">
        <a href="/oauth2/passwordless?tenantId=${tenantId!''}&client_id=${client_id!''}&nonce=${nonce!''}&redirect_uri=${redirect_uri!''}&response_type=${response_type!''}&scope=${scope!''}&state=${state!''}&timezone=${timezone!''}&metaData.device.name=${(metaData.device.name)!''}&metaData.device.type=${(metaData.device.type)!''}">
          <div class="magic login-button">
            <div>
              <div class="icon">
                <i class="fa fa-link"></i>
              </div>
              <div class="text">Login with a magic link</div>
            </div>
          </div>
        </a>
      </div>
      [/#if]

      [#if identityProviders["Facebook"]?has_content]
      <div class="form-row push-less-top">
        [@facebookButton identityProvider=identityProviders["Facebook"][0] clientId=clientId /]
      </div>
      [/#if]

      [#if identityProviders["Google"]?has_content]
      <div class="form-row push-less-top">
        [@googleButton identityProvider=identityProviders["Google"][0] clientId=clientId/]
      </div>
      [/#if]

      [#if identityProviders["Twitter"]?has_content]
      <div class="form-row push-less-top">
        [@twitterButton identityProvider=identityProviders["Twitter"][0] clientId=clientId/]
      </div>
      [/#if]

      [#if identityProviders["OpenIDConnect"]?has_content]
        [#list identityProviders["OpenIDConnect"] as identityProvider]
          <div class="form-row push-less-top">
            [@openIDConnectButton identityProvider=identityProvider clientId=clientId/]
          </div>
        [/#list]
      [/#if]
    </div>
  [/#if]
[/#macro]

#-- Below are the helpers for errors and alerts --]

[#macro printErrorAlerts]
  [#if errorMessages?size > 0]
    [#list errorMessages as m]
      [@alert message=m type="error" icon="exclamation-circle"/]
    [/#list]
  [/#if]
[/#macro]

[#macro printInfoAlerts]
  [#if infoMessages?size > 0]
    [#list infoMessages as m]
      [@alert message=m type="info" icon="info-circle"/]
    [/#list]
  [/#if]
[/#macro]

[#macro alert message type icon includeDismissButton=true]
<div class="row center-xs">
  <div class="col-xs col-sm-8 col-md-6 col-lg-5 col-xl-4">
    <div class="alert ${type}">
      <i class="fa fa-${icon}"></i>
      <p>
        ${message}
      </p>
      [#if includeDismissButton]
        <a href="#" class="dismiss-button"><i class="fa fa-times-circle"></i></a>
      [/#if]
    </div>
  </div>
</div>
[/#macro]

[#-- Below are the input helpers for hidden, text, buttons, labels and form errors --]

[#macro hidden name value=""]
  <input type="hidden" name="${name}" [#if value == ""]value="${(name?eval?string?html)!''}" [#else]value="${value?string?html}"[/#if]/>
[/#macro]

[#macro input type name id autocapitalize="none" autocomplete="on" autocorrect="off" autofocus=false spellcheck="false" label="" placeholder="" leftAddon="" required=false tooltip="" disabled=false class="" dateTimeFormat=""]
<div class="form-row">
  [#if label?has_content][#t/]
    <label for="${id}"[#if (fieldMessages[name]![])?size > 0] class="error"[/#if]>${label}[#if required]<span class="required">*</span>[/#if][#t/]
    [#if tooltip?has_content][#t/]
      <i class="fa fa-info-circle" data-tooltip="${tooltip?html}"></i>[#t/]
    [/#if][#t/]
    </label>[#t/]
  [/#if]
  [#if leftAddon?has_content]
    <div class="input-addon-group">
      <span class="icon"><i class="fa fa-${leftAddon}"></i></span>
  [/#if]
  <input type="${type}" name="${name}" [#if type != "password"]value="${(name?eval!'')}"[/#if] class="${class}" autocapitalize="${autocapitalize}" autocomplete="${autocomplete}" autocorrect="${autocorrect}" spellcheck="${spellcheck}" [#if autofocus]autofocus="autofocus"[/#if] placeholder="${placeholder}" [#if disabled]disabled="disabled"[/#if]/>
  [#if dateTimeFormat != ""]
    <input type="hidden" name="${name}@dateTimeFormat" value="${dateTimeFormat}"/>
  [/#if]
  [#if leftAddon?has_content]
    </div>
  [/#if]
  [@errors field=name/]
</div>
[/#macro]

[#macro errors field]
  [#if fieldMessages[field]?has_content]
<span class="error">[#list fieldMessages[field] as message]${message?string}[#if message_has_next], [/#if][/#list]</span>
  [/#if]
[/#macro]

[#macro button icon="arrow-right" color="blue" text="Submit" disabled=false]
<button class="${color} button${disabled?then(' disabled', '')}"[#if disabled] disabled="disabled"[/#if]><i class="fa fa-${icon}"></i> ${text}</button>
[/#macro]

[#macro passwordRules passwordValidationRules]
<div class="font-italic">
  <span>
    Password must meet the following constraints:
  </span>
  <ul>
    <li>Must be between ${passwordValidationRules.minLength} and ${passwordValidationRules.maxLength} characters in length</li>
    [#if passwordValidationRules.requireMixedCase]
      <li>Must contain both upper and lower case characters</li>
    [/#if]
    [#if passwordValidationRules.requireNonAlpha]
      <li>Must contain at least one non-alphanumeric character</li>
    [/#if]
    [#if passwordValidationRules.requireNumber]
      <li>Must contain at least one number</li>
    [/#if]
    [#if passwordValidationRules.rememberPreviousPasswords.enabled]
      <li>Must not match the previous ${passwordValidationRules.rememberPreviousPasswords.count} passwords</li>
    [/#if]
  </ul>
</div>
[/#macro]