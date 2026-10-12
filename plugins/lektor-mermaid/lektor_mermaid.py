from lektor.pluginsystem import Plugin
from markupsafe import escape


class MermaidPlugin(Plugin):
    name = "Mermaid"
    description = "Renders ```mermaid fences as <pre class=mermaid> for mermaid.js."

    def on_markdown_config(self, config, **extra):
        class MermaidMixin:
            def block_code(ren, text, lang=None):
                if lang == "mermaid":
                    return '<pre class="mermaid">%s</pre>\n' % escape(text)
                return super().block_code(text, lang)

        # must come first so it wins over the pygments highlighter mixin
        config.renderer_mixins.insert(0, MermaidMixin)
