#!/usr/bin/env bash

set -e

module_name=$1
app_name=$2

mv lib/foo_bar lib/${app_name}
mv lib/foo_bar.ex lib/${app_name}.ex
mv lib/foo_bar_web lib/${app_name}_web
mv lib/foo_bar_web.ex lib/${app_name}_web.ex
mv test/foo_bar_web test/${app_name}_web

find . -type f -not -path '*/\.*' -exec grep -l 'foo_bar' {} \; | while read -r file; do
    if [ "$file" != "./$script_name" ]; then
        echo "Processing file: $file"
        sed -i "s/foo_bar/$app_name/g" "$file"
    fi
done

echo "Replacement of 'foo_bar' with '$app_name' completed."

find . -type f -not -path '*/\.*' -exec grep -l 'FooBar' {} \; | while read -r file; do
    if [ "$file" != "./$script_name" ]; then
        echo "Processing file: $file"
        sed -i "s/FooBar/$module_name/g" "$file"
    fi
done

echo "Replacement of 'FooBar' with '$module_name' completed."
