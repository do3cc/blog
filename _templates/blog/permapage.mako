<%inherit file="blog_base_template" />
<%include file="post.mako" args="post=post" />
<div id="disqus_thread"></div>
<script type="text/javascript">
  var disqus_url = "${post.permalink}";
</script>
% if bf.config.blog.disqus.enabled:
<div class="show_disqus">Show Disqus comments</div>
<script type="text/javascript">
  camisinha_social(".show_disqus", '<script type="text/javascript" src="http://disqus.com/forums/${bf.config.blog.disqus.name}/embed.js"></'+'script>');
</script>
<noscript><a href="http://${bf.config.blog.disqus.name}.disqus.com/?url=ref">View the discussion thread.</a></noscript><a href="http://disqus.com" class="dsq-brlink">blog comments powered by <span class="logo-disqus">Disqus</span></a>
% endif
