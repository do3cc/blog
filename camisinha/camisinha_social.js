(function($){
    function camisinha_social(target, embed_html){
        $(target).click(function(){
            $(this).replaceWith(embed_html);
        });
    }
    window.camisinha_social = camisinha_social;
})(jQuery);
