# `ghreview` - Mass GitHub Review from Command Line

Sometimes you need to review a lot of pull requests with the same or very similar
small change. Using the GitHub web UI is not convenient for approving many pull
requests, for that purpose we have this `review.rb` helper script which can be
used from command line.

## Features

- Displays details of each pull request (title, diff)
- Displays also the check results (CI like Travis, etc...) to avoid merging
  a pull request which does not pass checks
- It can approve each pull request with the default "LGTM" message (Looks Good
  To Me), but you can use a custom message, see the [options](#options) below
- Optionally can merge the pull requests and delete the source branch

If a pull request is not approved then it is skipped and not touched at all.
You need to comment at the GitHub pull request page manually in that case.

## Usage

Just pass the list of the pull request URLs as the script arguments, for
example:

```shell
ghreview --merge https://github.com/yast/yast-users/pull/218 \
  https://github.com/yast/yast-firstboot/pull/76 \
  https://github.com/yast/yast-add-on/pull/84 \
  https://github.com/yast/yast-sysconfig/pull/29 \
  https://github.com/yast/yast-sound/pull/35
```

## Installation

The script is packaged as a Ruby gem, to install it run:

```shell
gem install ghreview
```

Alternatively you can run it directly from the GitHub sources:

```shell
git clone https://github.com/lslezak/ghreview.git
cd ghreview
bundle install --path vendor/bundle
bundle exec bin/ghreview ...
```

## Authentication

You need to [create a GitHub access token](https://github.com/settings/tokens)
to enable GitHub access from scripts.

### Using .netrc File

You can store the generated token into the `~/.netrc` file, see the
[this documentation](https://github.com/octokit/octokit.rb#using-a-netrc-file)
for more details.

Just make sure the `.netrc` file is not readable for the other users
(`chmod 0600 ~/.netrc`).

### Passing via Environment

Alternatively the access token can be passed via environment variable `GH_TOKEN`:

```shell
␣GH_TOKEN=... ./review ...
```

:warning: *Note the extra space at the beginning of the line, that is
required to avoid storing the command with the token into the shell history file
(like `~/.bash_history`).*

## Options

The script accepts these optional command line options:

- `--merge` (or `-g`) - Merge the pull request after approving it
- `--delete` (or `-d`) - Delete the source branch after merging (the YaST
  GitHub repositories have now enabled the auto-removal of the merged branches
  so this option is usually not needed)
- `--message` (or `-m`) - The text used in the, the default is `LGTM`
  (Looks Good To Me)
