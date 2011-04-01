---
categories: python, plone
date: 2011/01/11 10:10:10
title: Better debugging with pdbpp
---
A short while ago I found out about an alternative to ipdb, [pdbpp](http://pypi.python.org/pypi/pdbpp/).
among other features pdbpp offers, tab completion, syntax highlighting better code display (sticky mode).
It extends pdb so `import pdb;pdb.set_trace()` still works.

Sadly, there is a single thing one has to do to make it work with zope.
When pdb fires up, it loads some third party tools, one of them being pyrepl.
Pyrepl tries to register some signal handlers and this is usually impossible in your code because you are just in a simple thread where this is forbidden.
You will get the wrong error message:

[AttributeError: UnixConsole instance has not attribute 'old_sigwinch'](http://www.blogger.com/goog_530477067)


To get around this issue, create a file in your home directory named .fancycompleterrc.py
and add the following content:

$$code(lang=python)
from fancycompleter import DefaultConfig

class Config(DefaultConfig):
    prefer_pyrepl = False
$$/code

Pdbpp uses the fancycompleter for tab completion and we change the preferences here, so that pyrepl won't be used any longer.
