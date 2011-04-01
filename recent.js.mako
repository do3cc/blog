(function() {
    document.write('<ul>');
% for post in bf.config.blog.posts[:5]:
    document.write('<li><a href="${post.path}">${post.title.replace("'", "\\'")}</a></li>');
% endfor
    document.write('</ul>');
})();

