<%page args="current"/>
        <nav>
          <ul id="menu" class="clearfix">
            ${item("", "About")}
            ${item("blog/", "Developer Blog")}
            ${item("presentations/", "Presentations")}
          </ul>
          <br class="clear" />
        </nav>
<%def name="item(link, text)" ><% 
  if current == text.lower():
    cl = ' class="current"'
  else:
    cl = ''
  %><li${cl}><a href="${bf.config.site.root}${link}" bla="${current}" >${text}</a></li>
</%def>
