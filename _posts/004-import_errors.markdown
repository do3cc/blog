---
title: Do not catch import errors, use pkg_resources
categories: python, plone
date: 2010/08/20 10:10:10
---
After debugging a funny problem in tests which came from Circular
Imports that got eaten, let me show you how you can test, if some
package is available, and how you can test, if that package is new
enough:


So, this is a common snippet:

$$code(lang=python)
try:
    import Products.LinguaPlone
except ImportError:
    HAS_LINGUA_PLONE = False
else:
    HAS_LINGUA_PLONE = True
$$/code

That might trigger circular import exceptions. It will not always fail, depending
on what gets imported first. The circular import gets caught by the "except ImportError:" line. So you will not see an exception here, but in some other funny place. 
Good luck debugging that.

Another thing that I see sometimes is a check to implement backward compatibility

$$code(lang=python)
try:
    from foo import new_thing
except ImportError:
    OLD_FOO = True
else:
    OLD_FOO = False

if OLD_FOO:
    def new_thing(something):
    return something + 'cool'
$$/code

This can sometimes trigger ImportErrors and it does not show its intention like it could.

pkg_resources has an API which can help you to clarify things:

$$code(lang=python)
import pkg_resources
try:
    pkg_resources.get_distribution('Products.LinguaPlone>=4.0.0')
except pkg_resources.DistributionNotFound:
    HAS_LINGUA_PLONE = False
    HAS_CURRENT_LINGUA_PLONE = False
except pkg_resources.VersionConflict:
    HAS_LINGUA_PLONE = True
    HAS_CURRENT_LINGUA_PLONE = True
else:
    HAS_LINGUA_PLONE = True
    HAS_CURRENT_LINGUA_PLONE = True
$$/code

Now, that is a bit more verbose, but

<dl>
  <dt>
  It avoids hideous ImportErrors
  </dt>
  <dd>
  We don't try to import things and can't trigger circular exceptions
  </dd>
  <dt>
  It spells out its dependencies more clearly
  </dt>
  <dt>
  You can see in the code which version is needed for the workaround
  </dt>
  <dt>
  The chance that totally outdated workarounds will get removed is
  bigger.
  </dt>
  <dd>
  If someone sees a try: import, they most probably do not know for
  which version it was necessary. On the other hand, if they see the
  version requirement in plain code, they might have an idea that this
  is a test for a VERY outdated version of a dependency and might decide
  to delete it, since the package does not support the old version in
  other parts of the code anyway.
  </dd>
</dl>
