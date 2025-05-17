#!/usr/bin/env nu
use std log
use inc.nu install_latest_github_release

install_latest_github_release "version-fox/vfox" {
	'linux/aarch64': {assetPattern: 'vfox_($v)_linux_aarch64.tar.gz', archiveBinPathParts: ['vfox_($v)_linux_aarch64', 'vfox']},
	'linux/x86_64': {assetPattern: 'vfox_($v)_linux_x86_64.tar.gz', archiveBinPathParts: ['vfox_($v)_linux_x86_64', 'vfox']},
}
