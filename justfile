# Common tasks for the Colophon NetNewsWire theme.
# The tooling runs through npx and is never installed in this repository.

nnw := "npx --yes nnw-theme@2"

# List available recipes
default:
    @just --list

# Live preview gallery that rebuilds on save
preview:
    {{nnw}} preview

# Write the preview gallery once (build/preview/)
render:
    {{nnw}} render

# Release gate: package and test every case in WebKit
check:
    {{nnw}} check

# Alias for check
test: check

# Validate the theme and build the release ZIP (dist/), without WebKit
build:
    {{nnw}} package

# Screenshot one case, e.g. `just screenshot wordpress iphone dark`
screenshot fixture="article" platform="mac" appearance="light":
    {{nnw}} screenshot --fixture {{fixture}} --platform {{platform}} --appearance {{appearance}}

# Install the WebKit browser that check and screenshot use
setup:
    {{nnw}} setup

# List the ready-made fixtures
fixtures:
    {{nnw}} fixture list

# Increase the Info.plist Version before a release
bump *args:
    {{nnw}} bump {{args}}

# Print the authoring guide, or one topic (e.g. `just guide publishing`)
guide topic="":
    {{nnw}} guide {{topic}}

# Open the preview gallery in the browser
open: render
    open build/preview/index.html

# Remove generated output
clean:
    rm -rf build dist
