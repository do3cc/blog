<!DOCTYPE html>
<html lange="de">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"
    />
    <title>Buildout</title>
    <!-- configuration parameters -->
    <meta name="version" content="S5 1.2a2" />
    <meta name="defaultView" content="slideshow" />
    <meta name="controlVis" content="hidden" />
    <!-- style sheet links -->
    <link rel="stylesheet" href="/s5/default/slides.css" type="text/css" media="projection" id="slideProj" />
    <link rel="stylesheet" href="/s5/default/outline.css" type="text/css" media="screen" id="outlineStyle" />
    <link rel="stylesheet" href="/s5/default/print.css" type="text/css" media="print" id="slidePrint" />
    <link rel="stylesheet" href="/s5/default/opera.css" type="text/css"
          media="projection" id="operaFix" />
    <link rel="stylesheet" href="/css/presentation.css" type="text/css"
          media="screen" />
    <script src="/s5/default/slides.js"
    type="text/javascript"></script>
    <style type="text/css">
      div#header {
      padding-left: 212px;
      }
      .slide{
      padding-left: 212px;
      }
      .slide h1 {
      padding-left: 116px;
      text-transform: none;
      }
      .slidecontent {
      width: 20cm;
      }
    </style>
  </head>
  <body>
    <div class="layout">
      <div id="controls"><!-- DO NOT EDIT --></div>
      <div id="currentSlide"><!-- DO NOT EDIT --></div>
      <div id="header">
      </div>
      <div id="footer">
        <h1>Buildout</h1>
        <h2>8.1.2013</h2>
      </div>
    </div>
    <ol class="xoxo presentation">
      <li class="slide">
        <h1>Buildout</h1>
        <div class="slidecontent">
          <h3>Patrick Gerken</h3>
          <h4>Freelancer</h4>
          <ul>
            <li>http://do3.cc</li>
            <li>http://www.twitter.com/do3cc</li>
          </ul>
        </div>
      </li>
      <li class="slide">
        <h1>Was ist Buildout</h1>
        <div class="slidecontent">
          <div>
            Buildout ist ein Tool zum Bauen von Python Anwendungen
          </div>
      </li>
      </div>
      <div class="handout">
      </div>
      <li class="slide">
        <h1>Was macht Buildout 1</h1>
        <div class="slidecontent">
          <div>
            Definieren, welche Eggs installiert werden sollen.
          </div>
          <div>
            <p>
              <img src="http://gifsforum.com/images/image/o%20rly/grand/orlyorly.jpg" alt="O RLY"></img>
            </p><p>
            <small><a href="http://gifsforum.com">gifsforum.com</a></small>
          </p>
          </div>
        </div>
        <div class="handout">
        </div>
      </li>
      <li class="slide">
        <h1>Was macht Buildout 2</h1>
        <div class="slidecontent">
          <div>
            Exakt definieren, was in welcher Version von wo geholt werden soll.
          </div>
          <div>
            <img width="500px" src="python_comrades.png"></img>
          </div>
        </div>
        <div class="handout">
            Mein Egg benötigt weitere Eggs. Buildout löst die Abhängigkeiten auf. Ich kann, wenn ich will, genau definieren, welche Versionen ich haben möchte.
        </div>
      </li>
      <li class="slide">
        <h1>Was macht Buildout 3</h1>
        <div class="slidecontent">
          <div>
           C-Extensions 
          </div>
          <pre>
  [buildout]
  parts = foo
  [foo]
  recipe = zc.recipe.cmmi
  url = ftp://xmlsoft.org/libxml2/libxml2-git-snapshot.tar.gz
        </div>
        <div class="handout">
            Ich muss C-Klassen kompilieren. Buildout kommt mit CMMI Recipes (configure && make && make install) um sie zu bauen. Es gibt ein Buildout um reproduzierbar alle Python Versionen zu bauen.
        </div>
      </li>
      <li class="slide">
        <h1>Was macht Buildout 4</h1>
        <div class="slidecontent">
          <div>
            <h2>DRY</h2>
          </div>
          <pre>
  [buildout]
  parts = haproxy
          nginx
          flask
  nginx_port = 8080
  haproxy_port = 8090
  flask_port = 5000
  ...
        </div>
        <div class="handout">
            Ich kann mit spezialierten "Recipes" oder generischen Template "Recipes" Konfigurationen für nginx, meinen supervisor, meine paster configuration oder meine config.py kreieren. Ports und Hostnamen trage ich an einer Stelle ein und alle Dateien enthalten die neuen Versionen.
        </div>
      </li>
      <li class="slide">
        <h1>Was macht Buildout 5</h1>
        <div class="slidecontent">
          Grosses Ökosystem
        </div>
        <div class="handout">
          Rund um Plone gibt es Ökosystem das die Pluginarchtektur von Buildout nutzt, um sie zu erweitern.
        </div>
      </li>
      <li class="slide">
        <h1>Ökosystem 1</h1>
        <div class="slidecontent">
          <p>z3c.checkversions</p>
          <p>Sind meine Versionen noch aktuell?</p>
        </div>
        <div class="handout">
          Wenn ich alle Versionen auf eine spezifische Version "gepinnt" habe, ist meine Installation anhand des Buildouts weitgehend reproduzierbar. Wenn ich neuere Versionen möchte bin ich aufgeschmissen. Ausser ich verwende z3c.checkversions. Damit kann ich relativ einfach für alle dependencies prüfen, ob es neuere Versionen gibt.
        </div>
      </li>
      <li class="slide">
        <h1>Ökosystem 2</h1>
        <div class="slidecontent">
          <p>mr.developer</p>
          <p>Arbeite mit der bleeding edge, dem trunk oder master.</p>
          <p>Ohne dabei auszubluten</p>
        </div>
        <div class="handout">
          Mit mr.developer bin ich in der Lage für einzelne Eggs meine Source repositories anzugeben und entweder über die Buildout Konfiguration, oder ein Kommandozeilentool einzelne Source Checkouts zu aktivieren, oder zu deaktivieren.
          Wenn man sich darauf einigt, kann man über die richtige Verwaltung Releases planen. Erst wenn alle Source Checkouts im Buildout deaktiviert wurden, das heisst es wurden neue fertige Eggs dafür gebaut und deren Version eingetragen, wird ein neues Release deployed.
        </div>
      </li>
      <li class="slide">
        <h1>Ökosystem 3</h1>
        <div class="slidecontent">
          <p>zest.releaser</p>
          <p>Release in style</p>
        </div>
        <div class="handout">
          Der zest.releaser ist eigentlich für Eggs gedacht. Er hilft, saubere Releases zu machen. Er vereinfacht es, Changenotes zu vervollständigen, Versionen zu aktualisieren, Zeitstempel für die Change Notes zu setzen, die richtige Version in Code Repo zu taggen, und bereitet den trunk/master für die nächste Version vor.
          Mit zest.releaser kann man aber beliebige Code repositories releasen, Hauptsache es gibt irgendwo eine Datei mit Versionsinfos und eine Datei für die Changes. Nur auf Pypi kommt man damit nicht. Mit den beiden Konventionen kann man relativ einfach fertige Pakete von Buildouts schnüren. Für ein gutes Gefühl bei einem sauberen Deployment.
        </div>
      </li>
      <li class="slide">
        <h1>Technik</h1>
        <div class="slidecontent">
          <pre>
  [buildout]
  parts = fabric
  [fabric]
  recipe = zc.recipe.egg
  eggs = fabric
          </pre>
        </div>
        <div class="handout">
          Buildout alleine macht gar nicht so viel. Es liefert intern viele API Methoden für die "Recipes", aber Buildout an sich ist nur ein ConfigParser System mit Variablen und einigen globalen Parametern für die anderen Recipes. Die Funktionalität kommt mit den "Recipes" von denen Buildout selbst einige mitbringt. Das Beispiel auf diesem Slide ist installiert ein Egg.
        </div>
      </li>
      <li class="slide">
        <h1>Reproduzierbarkeit</h1>
        <div class="slidecontent">
          <pre>
  [buildout]
  parts = fabric
  allow-picked-versions = false
  versions = versions
  [fabric]
  recipe = zc.recipe.egg
  eggs = Fabric
  [versions]
  Fabric = 1.5.1
  distribute = 0.6.34
  paramiko = 1.9.0
  pycrypto = 2.6
  zc.recipe.egg = 1.3.2
          </pre>
        </div>
        <div class="handout">
          Dieses Buildout ist schon ein wenig strenger. Alles ist genau gepinnt, per Parameter wird gesagt, das nix ungepinnt gebaut werden darf.
          So eine Buildout lege ich meinem Code Repository ein, und ich kann ziemlich sicher sein, das jemand das System so testen kann.
        </div>
      </li>
      <li class="slide">
        <h1>Modularität</h1>
        <div class="slidecontent">
          <img src="modular.png" width="800px" />
        </div>
        <div class="handout">
          Wenn das System komplexer wird, verteilen wir die Konfiguration eben auf mehrere Dateien. In base definieren wir das Grundsystem, in versions pinnen wir die richtigen Versionen, KGS ist ein link auf eine URL unter der wir (hoffentlich) ein "Known Good Set" an Versionspinnings für das Basissystem erhalten. Wir wollen ja nicht alles selbst machen. Darunter sind die Anpassungen an die jeweiligen Umgebungen. Debug mode für Entwicklung und Tests, die passenden Ports und Resource URLs für die Produktion und Backup und Maintenance Scripte.
        </div>
      </li>
      <li class="slide">
        <h1>Eine Auswahl an wichtigen Recipes</h1>
        <div class="slidecontent">
          <ul>
            <li><a href="http://pypi.python.org/pypi/collective.recipe.template">collective.recipe.template</a></li>
            <li><a href="http://pypi.python.org/pypi/plone.recipe.command">plone.recipe.command</a></li>
            <li><a href="http://pypi.python.org/pypi/zc.recipe.egg">zc.recipe.egg</a></li>
            <li><a href="http://pypi.python.org/pypi/z3c.recipe.usercrontab">z3c.recipe.usercrontab</a></li>
            <li><a href="http://pypi.python.org/pypi/zc.recipe.testrunner">zc.recipe.testrunner</a></li>
            <li><a href="http://pypi.python.org/pypi/collective.recipe.omelette">collective.recipe.omelette</a></li>
            <li><a href="http://pypi.python.org/pypi/zc.recipe.cmmi">zc.recipe.cmmi</a></li>
            <li><a href="http://pypi.python.org/pypi/djangorecipe">djangorecipe</a></li>
          </ul>

        </div>
        <div class="handout">
        </div>
      </li>
      <li class="slide">
        <h1>Vielen Dank!</h1>
        <div class="slidecontent">
          Wer hat noch Fragen?
        </div>
        <div class="handout">
        </div>
      </li>
    </ol>
  </body>
</html>
