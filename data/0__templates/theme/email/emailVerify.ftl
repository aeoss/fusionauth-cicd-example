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

    [@helpers.main title="Email verification"]
      [#-- FusionAuth automatically handles errors that occur during email verification and outputs them in the HTML --]
      <form action="verify" method="POST" class="full">
        <p>
          Complete the form to request a new verification email.
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
