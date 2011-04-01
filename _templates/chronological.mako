<%inherit file="site.mako" />
% if page_heading != UNDEFINED:
<h1>${page_heading}</h1>
% endif
% for post in posts:
  <%include file="post_excerpt.mako" args="post=post" />
  <hr class="interblog" />
% endfor
% if prev_link:
 <a href="${prev_link}">« Previous Page</a>
% endif
% if prev_link and next_link:
  --  
% endif
% if next_link:
 <a href="${next_link}">Next Page »</a>
% endif
<%def name="robots_meta()">
  <meta name="robots" content="noindex,follow">
</%def>
