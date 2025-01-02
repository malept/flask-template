# Flask template for Copier

Template to automatically create Flask apps using `uv` and `ruff`
(plus some other linting tools).

## Installation

Requires [`copier`](https://copier.readthedocs.io/) and [`mise`](https://mise.jdx.dev).

Install `mise` via [their docs](https://mise.jdx.dev/getting-started.html).

```shell
mise use --global pipx:copier
```

## Usage

```shell
copier copy --trust https://github.com/malept/flask-template /path/to/new/local/repo
```

The `--trust` flag is required because the copier tasks do all of the
heavy lifting. Look at the `_tasks` list and audit all of the commands
that are run.

## License

```
Copyright (C) 2025 Mark Lee

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```
