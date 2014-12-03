define_webjump("c", "http://www.google.com/codesearch?q=%s");
define_webjump("d", "http://dict.leo.org/?lp=ende&lang=de&searchLoc=0&cmpType=relaxed&relink=on&sectHdr=off&spellToler=std&search=%s");
define_webjump("dd", "https://duckduckgo.com/html/?q=%s");
define_webjump("e", "http://www.google.com/cse?cx=004774160799092323420%3A6-ff2s0o6yi&q=%s&sa=Search&siteurl=emacswiki.org%2F", $alternative="http://www.emacswiki.org/");
define_webjump("g", "http://www.google.com/search?q=%s");
define_webjump("git", "http://www.github.com/search?q=%s");
define_webjump("o", "http://stackoverflow.com/search?q=%s");
define_webjump("w", "http://it.wikipedia.org/wiki/%s");
define_webjump("enit", "http://www.wordreference.com/enit/%s");
define_webjump("iten", "http://www.wordreference.com/iten/%s");
define_webjump("yt", "http://www.youtube.com/results?search_query=%s&search=Search");
define_webjump("hoogle", "http://haskell.org/hoogle/?hoogle=%s",
               $alternative = "http://haskell.org/hoogle/");
define_webjump("h", "http://google.com/search?as_sitesearch=hackage.haskell.org%2Fpackage&as_q=%s");
read_url_handler_list = [read_url_make_default_webjump_handler("s")];
define_webjump("alpha", "http://www36.wolframalpha.com/input/?i=%s");
