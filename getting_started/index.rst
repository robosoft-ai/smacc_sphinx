.. _getting_started:

Getting Started
###############

This document will take you through the process of installing the |PN| binaries
and navigating a simulated Turtlebot 3 in the Gazebo simulator.

.. note::

  See the :ref:`build-instructions` for other situations such as building from source or
  working with other types of robots.


Installation
************

1. Install the ROS 2 binary packages as described in the official docs
2. Install the |PN| packages using your operating system's package manager:

   .. code-block:: bash

      sudo apt install ros-<ros2-distro>-smacc2

Running the Example
*******************

1. Start a terminal in your GUI
2. Set key environment variables:

   .. code-block:: bash

      source /opt/ros/<ros2-distro>/setup.bash
     

3. In the same terminal, run

   .. code-block:: bash
      ros2 launch sm_atomic sm_atomic_launch.py