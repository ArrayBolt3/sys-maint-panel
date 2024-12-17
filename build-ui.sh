#!/bin/bash

## Copyright (C) 2024 - 2024 ENCRYPTED SUPPORT LP <adrelanos@whonix.org>
## See the file COPYING for copying conditions.

set -x
set -e
set -o nounset
set -o errtrace
set -o pipefail

project_base_dir="$(dirname "$(readlink -f "${0}")")";

for ui_file in "${project_base_dir}"/ui/*; do
  ui_file_basename="$(basename "${ui_file}")"
  ui_py_file_basename="$(cut -d'.' -f1 <<< "${ui_file_basename}").py"
  pyuic5 "${ui_file}" | tee -- "${project_base_dir}/usr/lib/python3/dist-packages/sys_maint_panel/${ui_py_file_basename}" > /dev/null
done
