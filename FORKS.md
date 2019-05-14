# RobotLocomotion/pybind11

Repository and Branch: [RobotLocomotion/pybind11@drake](https://github.com/RobotLocomotion/pybind11/tree/drake) ([commit](https://github.com/RobotLocomotion/pybind11/tree/f2bd883))

Purpose: Enable `pydrake`, [Drake: Using the Python Bindings](https://drake.mit.edu/python_bindings.html#using-the-python-bindings)

Additional features (with unittests):

1. Permit `dtype=object` for NumPy
    * Encompasses PR [pybind/pybind11#1152](https://github.com/pybind/pybind11/issues/1152 (more up-to-date version)
2. Casting to `unique_ptr`
    * Addresses [pybind/pybind11#1132](https://github.com/pybind/pybind11/issues/1132
3. Converting `unique_ptr` to `shared_ptr` via pybind; erroring out for
incompatible holders
    * Addresses [pybind/pybind11#1138](https://github.com/pybind/pybind11/issues/1138
        * Encompasses PR [pybind/pybind11#1161](https://github.com/pybind/pybind11/issues/1161
4. Prevent object slicing for Python subclasses of C++ superclasses.
Conservatively permit ownership transfer from Python to C++ and back.
    * Addresses:
        * [pybind/pybind11#1145](https://github.com/pybind/pybind11/issues/1145
        * [pybind/pybind11#1333](https://github.com/pybind/pybind11/issues/1333
        * [pybind/pybind11#1389](https://github.com/pybind/pybind11/issues/1389
        * [pybind/pybind11#1546](https://github.com/pybind/pybind11/issues/1546
        * [pybind/pybind11#1774](https://github.com/pybind/pybind11/issues/1774

Caveats:

* Introduces new public API for trampoline types, `py::wrapper<T>`
* Changes some internal structs; should probably have its internal API
version bumped to prevent collisions with other `pybind11` projects.
* Probably slower + more memory consumption due to ownership transfer
instrumentation
