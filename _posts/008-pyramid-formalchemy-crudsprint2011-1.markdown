---
categories: python, plone, buildout
date: 2011/06/17 10:10:10
title: Some results of the pyramid crudsprint 2011
---

It is day 2 of the pyramid crudsprint, unfortunately I have not a lot
to tell about day 1 because I got sick.

Today I added a paster template, so that you can add
pyramid_formalchemy easily to new applications or to existing ones.
After an idea by Gawel, the paster template does not create a pyramid
app, but all the scaffolding needed to get the crud interface up and
running. That means, that you have to modify two to three lines of
code for actually getting the crud support, but this also enables you
to use the same template for existing apps, apps created with
pyramid_*alchemy templates and akhet.

So if you are curious, here is a copy&paste example for a new
akhet app: 

    mkdir test
    cd test
    virtualenv . --distribute --no-site-packages
    . ./bin/activate
    pip install pyramid_formalchemy akhet
    paster create -t akhet -t pyramid_fa demo
    cd demo/demo
    echo "Add the Form Alchemy configuration to the app configuration"
    cat __init__.py | sed -e 's/\(.*\)\(config = Configurator.*\)/\1\2\n\1config.include("demo.fainit")/' >__init__.py2
    mv __init__.py2 __init__.py
    echo Activate the demo model
    cd models
    cat __init__.py | sed -e 's/#//' > __init__.py2
    mv __init__.py2 __init__.py
    cd ../../
    echo "Add the necessary dependencies to setup.py"
    cat setup.py | sed -e 's/\(.*\)\("Akhet",.*\)/\1\2\n\1"fa.jquery",\n\1"pyramid_formalchemy",/'> setup.py2
    mv setup.py2 setup.py
    python setup.py develop
    python -m demo.scripts.create_db development.ini
    paster serve development.ini

Now, visit:

    http://127.0.0.1:5000/admin

There you are, your admin interface.
