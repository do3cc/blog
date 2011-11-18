<!DOCTYPE html>
<html lange="de">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"
          />
    <title>Through the Web 2.0 und Diazo</title>
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
      background-image: url("wpd.png");
      }
      div#header {
      padding-left: 212px;
      }
      body {
      background-image: url("wpd.png");
      background-repeat: no-repeat;
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
        <h1>Deform</h1>
        <h2>06.10.2011</h2>
      </div>
    </div>
    <ol class="xoxo presentation">
      <li class="slide">
        <h1>Deform</h1>
        <div class="slidecontent">
          <h3>Patrick Gerken</h3>
          <ul>
            <li>http://www.do3.cc</li>
            <li>http://www.github.com/do3cc</li>
            <li>http://www.twitter.com/do3cc</li>
          </ul>
        </div>
      </li>
      <li class="slide">
        <h1>Deform</h1>
        <div class="slidecontent">
          <h3>Was passiert heute</h3>
          <ol>
            <li>Was ist Deform</li>
            <li>Woraus besteht Deform</li>
            <li>Wie verwendet man es</li>
            <li>Wie verwendet man es in X</li>
            <li>Fragen?</li>
          </ol>
        </div>
      </li>
      <li class="slide">
        <h1>Teil 1: Was ist Deform</h1>
        <div class="slidecontent">
          <h3>Was ist Deform</h3>
          <ul>
            <li>Deform ist eine Form library</li>
            <li>Es generiert HTML Forms und validiert Formular Eingaben</li>
          </ul><ul>
            <li>Geschrieben von Chris McDonough</li>
            <li>Erfinder von Pyramid, Deform ist aber kein Teil davon</li>
          </ul>
        </div>
      </li>
      <li class="slide">
        <h1>Teil 1: Was ist Deform</h1>
        <div class="slidecontent">
          <h3>Was ist Deform nicht</h3>
          <ul>
            <li>Deform baut keine komplette HTML Seite</li>
            <li>Deform persistiert keine Daten</li>
          </ul>
        </div>
      </li>
      <li class="slide">
        <h1>Teil 2: Woraus besteht Deform</h1>
        <div class="slidecontent">
          <ul>
            <li>Peppercorn</li>
            <li>Colander</li>
            <li>Deform</li>
          </ul>
        </div>
      </li>
      <li class="slide">
        <h1>Teil 2: Woraus besteht Deform</h1>
        <div class="slidecontent">
          <h3>Peppercorn</h3>
          <a href="http://plope.com/peppercorn">plope.com/peppercorn</a>
          <ul>
            <li>Komplexe Strukturen aus Formularen extrahieren</li>
            <li>Ein Blogpost mit ein paar Ideen zu hierarchichen Formularen</li>
            <li>Mit vollständiger Implementierung</li>
          </ul>
        </div>
      </li>
      <li class="slide">
        <h1>Teil 2: Woraus besteht Deform</h1>
        <div class="slidecontent">
          <h3>Peppercorn</h3>
          <ul>
            <li>Listen und Dicts benötigen Marker Inputs</li>
            <li>
              <ul>
                <li>
                  &lt;input name="__start__" value="my_list:sequence" /&gt;
                </li>
                <li>
                  &lt;input name="__end__" value="my_list:sequence" /&gt;
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </li>
      <li class="slide">
        <h1>Teil 2: Woraus besteht Deform</h1>
        <div class="slidecontent">
          <h3>Colander</h3>
          <ul>
            <li>Schema Bibliothek um Strukturen zu definieren.</li>
          </ul>
          <pre>
import colander

class Person(colander.MappingSchema):
    name = colander.SchemaNode(colander.String())
    age = colander.SchemaNode(colander.Integer(),
                              validator=colander.Range(0, 200))
          </pre>
        </div>
      </li>
      <li class="slide">
        <h1>Teil 2: Woraus besteht Deform</h1>
        <div class="slidecontent">
          <h3>Colander</h3>
          <ul>
            <li>Schema Bibliothek um verschachtelte Strukturen zu definieren.</li>
          </ul>
          <pre>
class People(colander.SequenceSchema):
    person = Person()
class Schema(colander.MappingSchema):
    people = People()

schema = Schema()
          </pre>
        </div>
      </li>
      <li class="slide">
        <h1>Teil 2: Woraus besteht Deform</h1>
        <div class="slidecontent">
          <h3>Colander</h3>
          <div>
            Schemas können auch dynamisch zur Laufzeit generiert werden.
          </div>
        </div>
      </li>
      <li class="slide">
        <h1>Teil 2: Woraus besteht Deform</h1>
        <div class="slidecontent">
          <h3>Deform</h3>
          <ul>
            <li>Kann HTML Formulare basierend auf Colander Schemas erzeugen</li>
            <li>Kann Eingaben auf Basis des Schemas und mit Hilfe von Peppercorn validieren und mappen</li>
            <li>Beherscht natürlich auch die Fehlerbehandlung</li>
          </ul>
        </div>
      </li>
      <li class="slide">
        <h1>Teil 2: Woraus besteht Deform</h1>
        <div class="slidecontent">
          <h3>Deform</h3>
          <pre>
from deform import Form
myform = Form(schema, buttons=('submit',))
form = myform.render(appstruct)
============================================================
controls = request.POST.items()

try:
    appstruct = myform.validate(controls)
except ValidationFailure, e:
    return {'form':e.render()}
          </pre>
        </div>
      </li>
      <li class="slide">
        <h1>Teil 2: Woraus besteht Deform</h1>
        <div class="slidecontent">
          <h3>Deform</h3>
          <img src="screenshot1.png" width="800px"></img>
        </div>
      </li>
      <li class="slide">
        <h1>Teil 3: Wie verwendet man Deform</h1>
        <div class="slidecontent">
          <p>
            Wer weiss es?
          </p>
          <p>
            Kleiner reminder:
          </p>
          <ul>
            <li>Schema mit Colander erstellen</li>
            <li>Form Objekt mit deform erstellen</li>
            <li>Leeres Form html mit form_ob.render() erstellen</li>
            <li>Form html mit form_ob.render(appstruct) erstellen</li>
            <li>Validierung mit my_form.validate(request_items)</li>
            <li>Falls die Validierung fehlschlägt, die Exception hat eine render Methode dafür</li>
          </ul>
        </div>
      </li>
      <li class="slide">
        <h1>Teil 3: Wie verwendet man Deform</h1>
        <div class="slidecontent">
          <h3>Javascript und CSS</h3>
          <ul>
            <li>Deform forms sagen, welche css und js Resourcen sie benötigen</li>
            <li>Deform verwendet javascript, das muss mittels deform.load() initalisiert werden.</li>
          </ul>
        </div>
      </li>
      <li class="slide">
        <h1>Teil 3: Wie verwendet man Deform</h1>
        <div class="slidecontent">
          <h3>Deformwidgets</h3>
          <ul>
            <li>Deform kommt mit den üblichen Verdächtigen und ein paar mehr Widgets mit.</li>
            <li>Es gibt eine dedizierte Demo Seite mit allen Widgets und Quellcode</li>
            <li><a href="http://deformdemo.repoze.org">deformdemo.repoze.org</a></li>
          </ul>
        </div>
      </li>
      <li class="slide">
        <h1>Teil 3: Wie verwendet man Deform</h1>
        <div class="slidecontent">
          <h3>Kompliziertere Anpassungen</h3>
          <ul>
            <li>Man kann Widgets auch eigene Templates geben</li>
            <li>Man kann einzelne Felder auch separat rendern:
            <div>
              my_form.children[0].render()
              my_form.children['name'].render()
            </div>
            Nur nicht Peppercorn Konventionen für Struktur vergessen!
            </li>
          </ul>
        </div>
      </li>
      <li class="slide">
        <h1>Teil 4: Wie verwendet man Deform</h1>
        <div class="slidecontent">
          <h3>Pyramid</h3>
            Keine Anpassungen notwendig
        </div>
      </li>
      <li class="slide">
        <h1>Teil 4: Wie verwendet man Deform</h1>
        <div class="slidecontent">
          <h3>Flask</h3>
          <ul>
            <li>Derzeit nur eingeschränkt möglich, Parameter werden nicht sortiert gespeichert, und multiple Werte erstmal maskiert</li>
          </ul>
        </div>
      </li>
      <li class="slide">
        <h1>Teil 4: Wie verwendet man Deform</h1>
        <div class="slidecontent">
          <h3>Django</h3>
          <ul>
            <li>Derzeit nur eingeschränkt möglich, multiple Werte erstmal maskiert, Sortierung bin ich mir jetzt nicht sicher</li>
          </ul>
        </div>
      </li>
      <li class="slide">
        <h1>Teil 4: Wie verwendet man Deform</h1>
        <div class="slidecontent">
          <h3>Plone/Zope</h3>
          <ul>
            <li>Ab heute Abend voll möglich mit dem Egg collective.deform</li>
          </ul>
        </div>
      </li>
      <li class="slide">
        <h1>Teil 5: Fragen</h1>
        <div class="slidecontent">
          <h3>Fragen</h3>
        </div>
      </li>
    </ol>
  </body>
</html>
