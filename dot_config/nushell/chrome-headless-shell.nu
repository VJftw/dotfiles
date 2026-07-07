use std log
use mise.nu

export def bootstrap [ ] {
    mise write_conf_d "chrome-headless-shell" {
        tools: {
            "http:chrome-headless-shell": {
                version: "latest",
                url: "https://storage.googleapis.com/chrome-for-testing-public/{{ version }}/linux64/chrome-linux64.zip",
                format: "zip",
                version_list_url: "https://googlechromelabs.github.io/chrome-for-testing/known-good-versions.json",
                version_json_path: ".versions[].version",
            },
        },
        tool_alias: {
            headless-shell: "http:chrome-headless-shell"
        }
    }

}

def main [ ] {
    bootstrap
}
