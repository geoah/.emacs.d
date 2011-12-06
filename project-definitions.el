(when (require 'eproject nil 'noerror)
  (define-project-type ruby (generic)
    (or (look-for "Rakefile") (look-for "Gemfile") (look-for "config.ru")
        (look-for "\.gemspec$") (look-for "Capfile"))
    :irrelevant-files ("vendor/bundle/" "coverage/" "^#.*#$" "\.DS_Store")))
