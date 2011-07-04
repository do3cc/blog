It has been tried before, and it usually ended in disastrous results.
But times are changing, Zope 2.12 does not need fake eggs any more,
things should just work, right?
It turns out, that things can still fail, but its doable.

First, pip does not know which version to use. The version
information in form of kgs is only maintained for buildouts.
We can, of course, abuse buildout to get the information we want.

First, create a virtualenv, with the --no-site-packages parameter.

Then pip install zopeskel.

Use paster to create a plone4_buildout, for best results, choose Plone
4.1 or the rc.

Do the bootstrap.

now run buildout annotate with the following shell magic::

    ./bin/buildout annotate | awk '/\[versions\]/,/\[[^v]/' | egrep -v '^ ' | sed -e 's/=/==/' | grep == > requirements.txt

Now we have our requirements file suitable for pip. But more things
are necessary. First, PIL will not be found, just replace it with
pillow == 1.7.2.  Second, if you use this with Plone 4.0,
zope.configuration is not new enough, you need 3.7.3 or higher, so
correct that dependency.

Now, install plone with pip -r requirements.txt

There is no instance yet, you can create one with mkzopeinstance, you
might remember that command.

Of you go. You have a mostly running Plone now. The only issue I found
so far, was that the generated zope.conf does not configure the blob
storage. Plone needs that for storing images, so you have to add this
by hand.

The given examples are a bit vague, there is a reason for that. You
should only play with this if you really know what you are doing. If
you just want to avoid to use buildout without having some experience
in running Plone with buildout, this is not for you.
