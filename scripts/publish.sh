#!/bin/bash

# 1. Run yarn export
# 2. Increase version and run bundle
# 3. Run sh scripts/publish.sh
# 4. Push to GitHub

set -e

gem build -o avo-icons.gem
gem push ./avo-icons.gem
rm avo-icons.gem
