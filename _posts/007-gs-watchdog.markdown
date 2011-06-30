#---
#categories: python, plone, buildout
#date: 2011/06/08 10:10:10
#title: Automatic checks for changes in the genericsetup profile
#---

Lately, I introduced an interesting bug on a customer site. Portlets
displaying search results were missing data. It turned out, that
the results get filtered by content types that shall be displayable in
the navigation, and the missing items were not marked as displayable
in the navigation in the plone control panel. I did not change
anything related to that, but before my last changes, these content
types have been displayed. Also, in the administration views, in the
list of content types to display, my content types were missing, I
could not change the settings.

It turns out, that the list of content types you can select for
displaying in the navigation, gets filtered. They are called the
friendly content types in the code. What makes a content type
friendly? It turns out, friendly content types are the one that you
can search for. Here is, what must have happened:

1.  New content types are created. Somebody chose that they should be
shown in the navigation.
2.  Somebody decides, that a number of content types should not be
searchable.
3.  I visit the Navigation configuration panel.
4.  Plone selects the content types that should be selectable for
being displayed in navigation. Note, that some content types that
currently are selected, get filtered, because they are not friendly.
5.  I press save.
6.  While I did not check or uncheck any checkbox of the content types
to list in navigation, the list of content types to list in navigation
has been changed.

While this behaviour sucks a bit, I am concerned with something else.
All these changes are not being tracked by our version control system.

