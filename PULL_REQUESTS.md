# To close
- pybind/pybind11#1138 - Inconsistent use of holder classes mess. Seems superseded by #1161. Either this or #1161 should get a more detailed review, before categorizing.


# Fixes
- pybind/pybind11#1084 - Bug fix. Reviewed - looks fine to merge. Needs to be rebased, though.


# Minor
- pybind/pybind11#1043 - Something about propagation of return policies. Removes 4 lines, should be safe, but there's a possibility that tests just don't cover what those 4 lines are doing.
- pybind/pybind11#1089 - Cmake C++ standard version settings. Turned into bikeshedding about cmake versions and whether cmake 3.3 is too new (in 2017). Good candidate for merge. 
- pybind/pybind11#1101 - Slicing with None. Simple enough, but blocked on repetition of code because `cast()` is not available and @henryiii claims forward declaration to be tricky.


# Major
- pybind/pybind11#1131 - Override overload order with `py::prepend()`. Jakob raised a concern about performance, but without backing it with numbers. Otherwise, no complaints and ready to be merged.


## Unfinished
- pybind/pybind11#781 - Far from finished. Seems very useful. I tried finishing it, but got stuck. Having a "lock into `py::class_` after `.def`" makes it hard to get done.


# To review
- pybind/pybind11#1098 - Cmake compiler features, by @henryiii. I haven't given it a proper review.
- pybind/pybind11#1122 - Construct `py::enum_` from std::string. A simple feature turned into a discussion about case sensitivity. I'm questioning the usefulness of the PR.
- pybind/pybind11#1161 - Look at #1138 
