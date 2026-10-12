"""Fail if the imprint loses required contact details or its footer link."""
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
IMPRINT = ROOT / "content" / "site.html" / "contents.lr"
LAYOUT = ROOT / "templates" / "layout.html"

REQUIRED_IMPRINT = [
    "Patrick Gerken",
    "Am Sieberath 33",
    "50129 Bergheim",
    "mailto:imprint@patrick-gerken.de",
    "https://mastodon.social/@do3cc",
    "https://www.linkedin.com/in/patrick-gerken/",
    "§ 5 DDG",
]
REQUIRED_LAYOUT = ["/site.html", "Impressum"]


def missing(path, needles):
    text = path.read_text(encoding="utf-8")
    return [n for n in needles if n not in text]


def main():
    problems = [f"{IMPRINT.name}: missing {n!r}" for n in missing(IMPRINT, REQUIRED_IMPRINT)]
    problems += [f"{LAYOUT.name}: missing {n!r}" for n in missing(LAYOUT, REQUIRED_LAYOUT)]
    for problem in problems:
        print(problem, file=sys.stderr)
    return 1 if problems else 0


if __name__ == "__main__":
    sys.exit(main())
