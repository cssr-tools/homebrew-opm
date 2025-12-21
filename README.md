[![Build Status](https://github.com/cssr-tools/brew-opm/actions/workflows/ci_brew_opm-flow_macos/badge.svg)](https://github.com/cssr-tools/brew-opm/actions/workflows/ci_brew_opm-flow_macos.yml)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

# Running actions in macOS to test Python repositoires using OPM Flow

This repository builds [_OPM Flow_](https://opm-project.org/?page_id=19) from the latest release (2025.10) in the latest available macOS in GitHub Actions,
showing the status and details of the build in the [_Actions_](https://github.com/cssr-tools/brew-opm/actions).

See [_this script_](https://github.com/cssr-tools/brew-opm/actions/workflows/ci_brew_opm-flow_macos.yml) that is
run in GitHub actions. Here, [_brew_](https://brew.sh) is used to install OPM Flow:

```bash
brew install cssr-tools/opm/opm-simulators
```

After you execute the above line, you can check if the installation of OPM Flow succeded by typing:

```bash
which flow
flow --version
```
