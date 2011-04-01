<%inherit file="post.mako" />
<%def name="post_prose(post)">
  ${post.excerpt}
  <p><a href="${post.permapath()}" rel="bookmark" title="Permanent Link to ${post.title}">more...</a></p>
</%def>
