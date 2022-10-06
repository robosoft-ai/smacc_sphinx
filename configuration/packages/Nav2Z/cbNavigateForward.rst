.. CbNavigateForward:

CbNavigateForward
==========================

``<CbNavigateForward>`` is the corresponding behavior name selected for this type.


Configuration options
-----------

:``<CbNavigateForward>``.forwardDistance:

  ====== =======
  Type   Default                                                   
  ------ -------
  double 0.55            
  ====== =======

  Description
    Distance to move forward

Example
-------

.. code-block:: c++

  static void staticConfigure()
  {
    configure<OrNavigation,CbNavigateForward>(3);
  }