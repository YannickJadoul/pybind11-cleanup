# To close
- pybind/pybind11#1138 - Inconsistent use of holder classes mess. Seems superseded by #1161. Either this or #1161 should get a more detailed review, before categorizing.
- pybind/pybind11#1266 - Enables readonly memory views. Two lines change, backwards compatible. No tests. Close in favour of #1466
- pybind/pybind11#1286 - Pybind GIL API is incompatible with the raw CPython API because they keep track of python state separately. This is a long and contrieved way of making them play nice. My opinion: close as it is a strange way to make these cooperate. Better solution for those that need CPython API is to have a basic pybind class without the "advance GIL use case".
- pybind/pybind11#1322 - Look at #1286
- pybind/pybind11#1447 - Workaround for PGI compiler bug. Bug is fixed on PGI version 18.7. Latest version is 18.10.
- pybind/pybind11#1494 - Dynamic attribute support on Pypy 6, breaks the tests and doesn't seem to work. The only thing indicating that it works is the PR author's word.
- pybind/pybind11#1633 - Wrong.
- pybind/pybind11#1720 - Tests PyPy 3.6 on Travis. Never really worked. Seems abandoned.
- pybind/pybind11#1746 - Adds the ability to set `__version__`, `__author__` and `__license__`. Review comment not answered, close as abandoned. Users who really want this can always do this with `module.attr("__version__") = "1.2.3"`. On the other hand, merging this PR makes pybind11 modules larger for all users.


# Fixes
- pybind/pybind11#1084 - Bug fix. Reviewed - looks fine to merge. Needs to be rebased, though.
- pybind/pybind11#1255 - Bazel "strict" mode fixes.
- pybind/pybind11#1329 - Bugfix for fixed sized numpy dtypes.
- pybind/pybind11#1334 - Bugfix for `__int__` and `__hash__` when `py::enum_` has underlying type of `char`.
- pybind/pybind11#1373 - Cmake bugfix. Sets `PythonLibsNew_FOUND` in `tools/FindPythonLibsNew.cmake`
- pybind/pybind11#1629 - Typo
- pybind/pybind11#1635 - Typos in documntation
- pybind/pybind11#1657 - Static analysis found a NULL dereference. If `obj` in this context can never be null, close this PR in favour of pybind/pybind11#1664.
- pybind/pybind11#1658 - Static analysis found some uinitialized member variables.
- pybind/pybind11#1659 - Static analysis found a NULL dereference.
- pybind/pybind11#1660 - Static analysis found some uinitialized member variables.
- pybind/pybind11#1661 - Static analysis found some uinitialized member variables.
- pybind/pybind11#1664 - See pybind/pybind11#1657.
- pybind/pybind11#1675 - Typos
- pybind/pybind11#1676 - Document `get_overload`
- pybind/pybind11#1678 - Set `-std=c++XY` only for C++ files if CMake is 3.3 or newer.
- pybind/pybind11#1683 - Another typo, this time in a macro.
- pybind/pybind11#1709 - Allows `def_readonly` and `def_readwrite` to be used with union types. Could also be considered a minor feature.
- pybind/pybind11#1715 - Basically a typo. Arguments are passed in the wrong order.
- pybind/pybind11#1726 - Makes the link to Gitter more visible. Fixes pybind/pybind11#1724.
- pybind/pybind11#1732 - Makes static member functions, added with `def_static`, `staticmethod` descriptor instances.
- pybind/pybind11#1734 - Correctly reports exceptions that are set but not thrown during import, this could happen with numpy and cairo libraries. I would really like to have a test for this.
- pybind/pybind11#1748 - Fix casting of time points with non-system-clock duration with VS.
- pybind/pybind11#1760 - Explicitly explains the behaviour of `.none(true)` with regards to different bound types.


# Minor
- pybind/pybind11#1043 - Something about propagation of return policies. Removes 4 lines, should be safe, but there's a possibility that tests just don't cover what those 4 lines are doing.
- pybind/pybind11#1089 - Cmake C++ standard version settings. Turned into bikeshedding about cmake versions and whether cmake 3.3 is too new (in 2017). Good candidate for merge. 
- pybind/pybind11#1101 - Slicing with None. Simple enough, but blocked on repetition of code because `cast()` is not available and @henryiii claims forward declaration to be tricky.
- pybind/pybind11#1192 - Allows `std::enable_shared_from_this` to be used for casting and lets pybind avoid a copy in some cases.
- pybind/pybind11#1210 - Moves optional and variant casters into their own header. Backwards compatible. Bikeshedding made it go stale. Should be merged as is and the bikeshedding discussion, that could be proven useful, taken to a separate issue.
- pybind/pybind11#1260 - R-value references support for `py::cast()`
- pybind/pybind11#1394 - Signed slices
- pybind/pybind11#1413 - Allow builtins to be used as callbacks
- pybind/pybind11#1466 - Similar idea to memory views, but with a greater scope. Adds readonly flag to the buffer protocol. The `py::array` and others (including memory views) would be separate PRs. Looks ready, but should be looked at again.
- pybind/pybind11#1496 - `py::bind_vector` can only be extended by another object of the same type, so `string_vector.extend(['asd'])` doesn't work, but `string_vector.extend(StringVector(['asd']))` does. One of the official maintainers called this "an overlooked feature".
- pybind/pybind11#1767 - Adds `__contains__` to `py::bind_map` for better performance. Without it operator `in` falls back to `__iter__`.


# Major
- pybind/pybind11#1131 - Override overload order with `py::prepend()`. Jakob raised a concern about performance, but without backing it with numbers. Otherwise, no complaints and ready to be merged.
- pybind/pybind11#1196 - Keyword-only arguments support.


# Unfinished
- pybind/pybind11#781 - Far from finished. Seems very useful. I tried finishing it, but got stuck. Having a "lock into `py::class_` after `.def`" makes it hard to get done.
- pybind/pybind11#1209 - An attempt to fix a core dump when a C++ thread running a python script gets terminated. Uses some GCC specific black magic, so I don't know what it is about. Tests are needed.
- pybind/pybind11#1220 - Correctly document that pybind requires cmake 3.0
- pybind/pybind11#1243 - Nicer error instead of `std::bad_alloc` in one specific case. Lacks tests.
- pybind/pybind11#1325 - Allows custom numpy ufuncs to be defined. Work in progress. Stale.
- pybind/pybind11#1368 - Fixes a segfault with iostream wrappers and releasing GIL.
- pybind/pybind11#1428 - "Generalize cmake support" was greenlighted by @jakob, but was missing the update to the docs.
- pybind/pybind11#1463 - `py::isinstance<py::str>` is too permissive. BUgfix is a WIP.
- pybind/pybind11#1648 - Minor feature, backwards compatible, but lacks tests.
- pybind/pybind11#1651 - Implements py::with according to PEP-343, needs to be rebased, otherwise, ready.
- pybind/pybind11#1687 - Makes `py::pythonbuf` contain a `std::unique_ptr<char[]>` instead of `char[1024]` so that users can set their desired buffer size. No tests. Motivation not compeling. In "Unfinished" category because of the lack of tests and the posibility to be proven wrong about the motivation.
- pybind/pybind11#1703 - Support for compiling with `-fno-exceptions`. Motivation: Google wants to use pybind11. Unfinished because I left a few comments that were not addressed.
- pybind/pybind11#1769 - Interesting use case with two extension modules where one module throws and the other catches the exception. The problem lies in internal/external linkage of some pybind11 types.


# To review
- pybind/pybind11#1098 - Cmake compiler features, by @henryiii. I haven't given it a proper review.
- pybind/pybind11#1122 - Construct `py::enum_` from std::string. A simple feature turned into a discussion about case sensitivity. I'm questioning the usefulness of the PR.
- pybind/pybind11#1161 - Look at #1138 

# Issue reproducer
- pybind/pybind11#1257 - Talks about a specific combination of virtual inheritance and diamond pattern causing a crash on MSVC.
- pybind/pybind11#1301 - Talks about a memory leak.
- pybind/pybind11#1393 - Talks about "overload ambiguity between Numpy arrays and scalar".
