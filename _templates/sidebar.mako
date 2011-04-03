<div id="sidebar" class="grid_3 omega">
  <aside class="widget">
    <h3>Contact</h3>
    <p>Patrick Gerken</p>
    <p> 
      <a href="mailto:gerken@patrick-gerken.de">gerken@patrick-gerken.de</a>
    </p>
  </aside>
  <aside class="widget">
    <h3>Recent posts</h3>
    <script src="${bf.config.site.root}recent.js"></script>
    <p>
      <a class="feed" href="${bf.util.site_path_helper(bf.config.blog.path,'feed/index.xml')}">Subscribe to posts</a>
    </p>
  </aside>
  <aside class="widget">
    <aside class="widget">
      <h3>Archives</h3>
      <p>
        <select onchange="location=this.options[this.selectedIndex].value;">
          <option disabled="disabled">Choose a month</option>
          % for link, name, num_posts in bf.config.blog.archive_links:
          <option value="${bf.util.site_path_helper(bf.config.blog.path,link)}/1">${name}&nbsp;(${num_posts})</option>
          % endfor
        </select>
      </p>
    </aside>
</div> <!-- end sidebar -->
