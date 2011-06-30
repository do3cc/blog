
A short while ago, I helped a friend to debug a site. After adding blob
support to a Plone 3 Site, about 20% of the requests for a specific
content type threw exceptions.

These are the bugs everybody loves.  

He had all eggs pinned down, but for adding the blob support, he
temporarily allowed buildout to get unpinned eggs. You can
activate and deactivate this with the following parameter:

    # We allow buildout to pick any version it considers valid
    allow-picked-versions = true

    # We prohibit buildout to get an egg for which we did NOT provide version information 
    allow-picked-versions = false

After that, he added the blob egg as an dependency and added the
extension buildout.dumppickedversions.
This extension shows you which version buildout chose for the eggs
where you did not provide a version requirement by pinning.

Sadly, some of the required eggs for blob support already released new
versions incompatible with some eggs of Plone 3.

While it would be nice if the package would have declared that it needs
a newer Plone, it is not (yet) common best practice. It would also
not be a complete solution, because it can be very hard to find out
all minimum requirements, and if some minimum requirements are forgotten
and the egg released, the problem cannot be easily fixed. Eggs should
never get deleted, neither altered.

There is no easy solution, but these things help:

- Have lots of tests
- Upgrade to new releases early
- Add your plone.app.blob dependency, do not allow buildout
to use unpinned egg and then, for each error because of an unpinned egg,
review the changes of the given egg and look for traces of potential
problems, or try to choose a version that was released just before the
plone release you are currently using.


For the curious, this is what happened
--------------------------------------

Act 1:
======
There is always somewhere some caching involved, some code chunk
did something to objects and cached the results. As the cache key,
the archetypes.UID was used. Now that we have plone.uuid, somebody changed
the implementation to use plone.uuid. We use Plone 3, our Archetypes does not
provide the right adapter for plone.uuid. The egg that does the caching
does not declare that it needs the newer Archetypes version.
Buildout got the newest egg for everything we did not pin. We pinned
archetypes but we did not have a pinning in place for the newly required
egg that uses plone.uuid and needs a newer archetypes without declaring
that.

Act 2:
======
The caching also happens in requests where new Archetypes objects get
created. These objects do not yet have an UUID. In these case only, the
memory address is used as a fallback. The new version that uses
plone.uuid, also uses that feedback, but with no adapter for plone.uuid,
the fallback will always be used.

Act 3:
======
Depending on the content type, a different number of objects get cached
and a different number of objects gets garbage collected. For one
content type, there is a 20 % chance that the following happens:

1.  Object A of type B gets processed, the result gets cached, and the
    memory address gets used as a cache key.
2.  Nothing references object A any longer.
3.  The garbage collector notices this and frees the memory.
4.  Somebody needs an instance of type D, and gets an object C,
    accidentally the memory address is the same as the one of object A
5.  This time, the object C shall also be processed like object A in 
    Step 1. Before object C is getting processed, the method looks into
    the cache, and the cache still contains the result for object
    A. Since object A and object C have the same memory address, and the
    memory address is used as the cache key, we get the processed
    results of object A.
6.  The processed result of object A and object C do not match. At a
    later stage, an exception is thrown because of that. The traceback
    does not show any relation to the problem that occured in Step 5.
