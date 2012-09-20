---
categories: plone
tags: debugging
date: 2012/09/20 10:10:10
title: Debugging zc.relations / Broken BTrees
---

Lately we encountered a serious problem with a site.
The site uses Dexterity and our content objects have relationfields.
In the beginning of the Project, we had a dependency on Products.LinguaPlone but removed it later in favor of plone.multilingual.

Sometimes, removing a product is hard, especially if persistent utilites are involved. Luckily, one can remove persistent utilities with wildcard.fixpersistentutiliries.

So we thought we are pretty safe now, but after a while the following traceback crept up:

    1348150731.020.336585243806 http://somesite/edit
    Traceback (innermost last):
      Module ZPublisher.Publish, line 126, in publish
      Module ZPublisher.mapply, line 77, in mapply
      Module ZPublisher.Publish, line 46, in call_object
      Module plone.z3cform.layout, line 70, in __call__
      Module plone.z3cform.layout, line 54, in update
      Module plone.dexterity.browser.edit, line 52, in update
      Module plone.z3cform.fieldsets.extensible, line 59, in update
      Module plone.z3cform.patch, line 30, in GroupForm_update
      Module z3c.form.group, line 138, in update
      Module z3c.form.action, line 99, in execute
      Module z3c.form.button, line 315, in __call__
      Module z3c.form.button, line 170, in __call__
      Module plone.dexterity.browser.edit, line 27, in handleApply
      Module z3c.form.group, line 119, in applyChanges
      Module zope.event, line 31, in notify
      Module zope.component.event, line 24, in dispatch
      Module zope.component._api, line 136, in subscribers
      Module zope.component.registry, line 321, in subscribers
      Module zope.interface.adapter, line 585, in subscribers
      Module zope.component.event, line 32, in objectEventNotify
      Module zope.component._api, line 136, in subscribers
      Module zope.component.registry, line 321, in subscribers
      Module zope.interface.adapter, line 585, in subscribers
      Module z3c.relationfield.event, line 82, in updateRelations
      Module zc.relation.catalog, line 546, in unindex
      Module zc.relation.catalog, line 556, in unindex_doc
      Module zc.relation.catalog, line 621, in _remove
    KeyError: <InterfaceClass wildcard.fixpersistentutilities.classfactory.IFakeInterface>

In that line of code, zc.relation tries to extract the key `<InterfaceClass wildcard.fixpersistentutilities.classfactory.IFakeInterface>` from an OOBtree.
That OOBTree claimed that the OOBTree does not contain that key, but when iterating over the keys of the OOBTree, the key was right there.

After a lot of reading the wrong docs (I assumed that the key really does not exist in the BTree and assumed I found a bug in zc.relation, thus trying to understand zc.relation internals first) I reread the documentation of BTrees itself, especially the part about [Total Ordering and Persistence](http://www.zodb.org/documentation/guide/modules.html#total-ordering-and-persistence).

It turned out that the IFakeInterface from above was not in the correct order. I used the check() method from BTree.check on the btree to confirm that.

Luckily, there is a fast way to repair a BTree so I went on to fix it:

    > ./bin/instance -O Plone debug
    
    ... from zope.component import getUtility
    ... from zc.relation.interfaces import ICatalog
    ... catalog = getUtility(ICatalog)
    ... btree = catalog._name_TO_mapping['to_interfaces_flattened']
    ... catalog._name_TO_mapping['to_interfaces_flattened'] = btree.__class__(btree)

Creating a copy of the BTree will readd everything in the right order.

I am going to improve the error reporting in zc.relation to give a better hint of what might be wrong, but I am not sure of a good way to repair such a problem automatically.

Anyway, I hope this helps!


