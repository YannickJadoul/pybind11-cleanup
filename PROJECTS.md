# PyTorch

Docs:

* [User: API Reference](https://pytorch.org/tutorials/advanced/cpp_extension.html#binding-to-python)
* [Dev: Extensions, pybind11](https://pytorch.org/tutorials/advanced/cpp_extension.html#binding-to-python)
* [Dev: Codebase Structure](https://pytorch.org/docs/stable/community/contribution_guide.html#codebase-structure)

# SMTK

Docs:

* [Dev: Generate pybind11 API](https://smtk.readthedocs.io/en/latest/userguide/bindings/generating-pybind11-bindings.html)
    * [Customizing bindings](https://smtk.readthedocs.io/en/latest/userguide/bindings/customizing-pybind11-bindings.html) - due to tempaltes

# Drake

Docs:

* [User: Python Bindings](https://drake.mit.edu/python_bindings.html#using-the-python-bindings)
* [Dev: Python Bindings](https://drake.mit.edu/doxygen_cxx/group__python__bindings.html)
* [User: API Reference](https://drake.mit.edu/pydrake/index.html#://)

Additional API stuff:

* Updated and more performant (non-multiprocess) version of `mkdoc`:
    * [Code](https://github.com/RobotLocomotion/drake/blob/b3e0ee556aaf2d87a3f2f36ba379f6b4169a18c6/third_party/com_github_pybind_pybind11/mkdoc.py)
    * Example: [header](https://github.com/RobotLocomotion/drake/blob/b3e0ee556aaf2d87a3f2f36ba379f6b4169a18c6/tools/workspace/pybind11/test/sample_header.h), [generated strings](https://github.com/RobotLocomotion/drake/blob/b3e0ee556aaf2d87a3f2f36ba379f6b4169a18c6/tools/workspace/pybind11/test/sample_header_documentation.expected.h)
    * API Reference above uses this
* Injecting Python code into pybind11 modules
    * Code: [C++](https://github.com/RobotLocomotion/drake/blob/b3e0ee556aaf2d87a3f2f36ba379f6b4169a18c6/bindings/pydrake/pydrake_pybind.h#L71), [Python](https://github.com/RobotLocomotion/drake/blob/b3e0ee556aaf2d87a3f2f36ba379f6b4169a18c6/bindings/pydrake/__init__.py#L44)
    * Example: [binding](https://github.com/RobotLocomotion/drake/blob/fb3e0ee556aaf2d87a3f2f36ba379f6b4169a18c6/bindings/pydrake/symbolic_py.cc#L617), [Python](https://github.com/RobotLocomotion/drake/blob/f599af4dd81bdfc363c6579546e437234a9887f7/bindings/pydrake/_symbolic_extra.py)
* Binding C++ template API directly in Python (classes + functions)
    * [pybind11 unittest](https://github.com/RobotLocomotion/drake/blob/b3e0ee556aaf2d87a3f2f36ba379f6b4169a18c6/bindings/pydrake/common/test/cpp_template_pybind_test.cc)
    * [Python unittest](https://github.com/RobotLocomotion/drake/blob/b3e0ee556aaf2d87a3f2f36ba379f6b4169a18c6/bindings/pydrake/common/test/cpp_template_test.py)
    * Example: [binding](https://github.com/RobotLocomotion/drake/blob/08dc486dfb2b68ada75cdbcb426f7e882c3f8746/bindings/pydrake/systems/sensors_py.cc#L101), [usage](https://github.com/RobotLocomotion/drake/blob/08dc486dfb2b68ada75cdbcb426f7e882c3f8746/bindings/pydrake/systems/test/sensors_test.py#L71), [Sphinx docs](https://drake.mit.edu/pydrake/pydrake.systems.sensors.html#pydrake.systems.sensors.ImageTraits)
* `namedview`
    * [Code](https://github.com/RobotLocomotion/drake/blob/b3e0ee556aaf2d87a3f2f36ba379f6b4169a18c6/bindings/pydrake/common/containers.py#L164)
    * [Example](https://github.com/RussTedrake/underactuated/blob/f84e5a7577342405d239ea7688fa2dcbe021726c/src/spring_loaded_inverted_pendulum/plant.py#L10)
