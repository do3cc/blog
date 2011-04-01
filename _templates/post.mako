<%page args="post"/>
<article class="post">
  <header>
    <h1><a href="${post.permapath()}" rel="bookmark" title="Permanent Link to ${post.title}">${post.title}</a></h1>
    <p><% 
          t = post.date.strftime("%Y-%m-%dT%H:%M:%S%z")
          t = t[:-2] + ':' + t[-2:] %>
      <time datetime="${t}" pubdate>${post.date.strftime("%B %d, %Y at %I:%M %p")}
      </time> | tags: 
<% 
   tag_links = []
   for tag in post.tags:
       if post.draft:
           #For drafts, we don't write to the tag dirs, so just write the categories as text
           tag_links.append(tag.name)
       else:
           tag_links.append("<a href='%s'>%s</a>" % (tag.path, tag.name))
%>
${", ".join(tag_links)}
% if bf.config.blog.disqus.enabled:
 | <a href="${post.permalink}#disqus_thread">View Comments</a>
% endif
    </p>
  </header>
  ${self.post_prose(post)}
</article>

<%def name="post_prose(post)">
  <div class="textToIndex">
    ${post.content}
  </div>
</%def>
