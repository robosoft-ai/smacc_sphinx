.. _build-troubleshooting-guide:

Build Troubleshooting Guide
**********************************************

Common SMACC2 Dependencies Build Failures
=======================================

* Make sure that .bashrc file has no ROS environment variables in it. Open new terminals and try to build the packages again.

* Make sure to run rosdep for the correct ROS 2 distribution.
  ``rosdep install -y -r -q --from-paths src --ignore-src --rosdistro <ros2-distro>``

* Make sure that the ``setup.bash`` is sourced in the ROS 2 installation or ROS 2 main build workspace, if applicable. Check if you can run talker and listener nodes.

* Check if you have the correct ROS version and distribution. ``printenv | grep -i ROS``

* Make sure you've activated the lifecycle nodes if you're not seeing transforms or servers running.

* Search `GitHub Issues <https://github.com/robosoft-ai/SMACC2/issues>`_

* Make sure you're using the correct branch for your distribution. There is no cross support from branch for ``DistroA`` in ``DistroB``. The main development branch uses the rolling distribution.

Still can't solve it? Let us know about your issue. `Open a ticket <https://github.com/robosoft-ai/SMACC2/issues/new>`_.

Reporting Issue
===============

- If you run into any issues when building Navigation2, you can use the search tool in the issues tab on `GitHub <https://github.com/robosoft-ai/SMACC2/issues>`_ and always feel free to `open a ticket <https://github.com/robosoft-ai/SMACC2/issues/new>`_.
