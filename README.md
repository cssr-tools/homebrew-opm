[![Build Status](https://github.com/cssr-tools/homebrew-opm/actions/workflows/ci_brew_opm-flow_resinsight_macos.yml/badge.svg)](https://github.com/cssr-tools/homebrew-opm/actions/workflows/ci_brew_opm-flow_resinsight_macos.yml)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

# Installing ResInsight and OPM Flow with support for mpirun in macOS using brew

This repository uses [_brew_](https://brew.sh) to build [_ResInsight_](https://resinsight.org) (v2025.12.0) and [_OPM Flow_](https://opm-project.org/?page_id=19) (v2025.10) in macOS Tahoe in GitHub Actions, showing the status and details of the build in the [_Actions_](https://github.com/cssr-tools/homebrew-opm/actions).
See [_this script_](https://github.com/cssr-tools/homebrew-opm/blob/main/.github/workflows/ci_brew_opm-flow_resinsight_macos.yml) that is run in GitHub actions.

```bash
brew install cssr-tools/opm/opm-simulators
brew install cssr-tools/opm/resinsight
```

After you execute the above lines, you can check if the installation of OPM Flow succeded by typing in the terminal `flow --help`, and ResInsight is launched by typing `resinsight`.
