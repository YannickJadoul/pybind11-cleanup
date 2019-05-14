sed -i -E 's/(^|[^[])(pybind\/pybind11)#([0-9]+)/\1[\2#\3](https:\/\/github.com\/\2\/issues\/\3)/g' *.md
