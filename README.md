
# FusionAuth CI/CD Example

This repository provides an example for how the CI/CD process with the [`fusionauth-cicd`](https://github.com/aeoss/fusionauth-cicd) container
works.

An example has been provided for Gitlab CI. Other services should be configured similarly. Pull requests
welcome!

## Directory Structure

### `/data/0__templates`

This directory holds template files, both for the Login UI and email templates. Login UI templates
are configured within the `theme` directory. Mail templates are mapped to a directory within `email/`
via the `map.yml` file.

### `/data/1__config`

This directory holds configuration files. It is recommended to use Yaml syntax to import the configuration
as required by the `systemConfiguration` object in FusionAuth. See the `config.yml` file for an example of
how this is done.

The CI/CD container will read all yaml files within any directory to build this up. This also allows the config
to use an email template ID. See `0__templates/map.yml` and `1__config/email.yml` for an example of this.

## Order of Prescedence

An order of presencense is required to use Yaml pointers. As such, we number folders and files within folders
in the order we require them to be loaded. This allows us to ensure our Yaml pointers have been parsed and are
available.

## Environment Variables

You should never put your secrets in a plain text file, and because of this we have created the ability to use
Yaml pointers to point to environment variable values. All environment variables available at runtime are
accessible via the Yaml pointer to `E_{{NAME}}` where `{{NAME}}` is the name of the environment variable.

For example, this example project expects an environment variable by the name of `JWT_SECRET` within the
`1__config/3__jwt_config.yml`. If your environment variable is not present, a pointer error will occur and
the CI/CD job will fail.

### Required Env Variables

A few environment variables are required for the CI/CD container to run properly. These are listed below.

#### `FUSIONAUTH_URL`

This environment variable expects a string containing the full URL to your FusionAuth instance. We automatically
append `/api/...` to the URL, so please do not include that.

If your FusionAuth is at `https://login.example.org`, provide that.

#### `FUSIONAUTH_TOKEN`

This is an API token with access to GET/POST/PUT to the proper API endpoints. You'll need the ability
to GET/POST/PUT to email templates, and PATCH to system-configuration. If you don't use email templates you do
not need to provide access to that endpoint.

### Optional Env Variables

A few environment variables are optional for the CI/CD container. These are listed below.

#### `DEBUG`

This environment variable expects a boolean value. This variable controls whether debugging output is enabled
or not. If enabled, the CI/CD container will output the full JSON object built by the Yaml processor. This is
useful for seeing what will be PATCH'd to your FusionAuth instance's API.
