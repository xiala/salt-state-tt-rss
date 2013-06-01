# setup and manage tt-rss

## required pillars

  tt-rss:
    url: "https://reader.xiala.net"
    base: "/srv/tt-rss"
    app: "/srv/tt-rss/www"
    cache: "/srv/tt-rss/data"
    contrib: "/srv/tt-rss/contrib"
    lock: "/srv/tt-rss/lock"
    db:
      user: 'ttrss'
      pass: ''
    ex_dirs:
      - "/srv/tt-rss/contrib"
      - "/srv/tt-rss-ourcontrib"
    plugins:
      - {{ plugin_name }}:
          {{ plug_prop }}: {{ plug_val }}
