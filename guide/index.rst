Docs Writing Guide
==================

Getting Started
---------------

First we need to build the Docker image. This can be done by running the
following command:

    ``docker build -t sphinx-doc .``

Some useful commands have been provided:


    ``./makepdf``
        Generates the PDF files

    ``./watch``
        Starts a web server that watches for changes to the documentation.
        This uses port ``5500``.


Diagrams
--------

PlantUML is included in the Docker image and should be used to generate
UML diagrams.

Example Usage
`````````````

An example UML diagram:

.. uml::
    Alice -> Bob: "Hi!"
    Alice <- Bob: "How are you?"

This diagram is generated with the following::

    .. uml::
        Alice -> Bob: "Hi!"
        Alice <- Bob: "How are you?"

For more information, please visit the
`PlantUML homepage <http://plantuml.com>`_.
