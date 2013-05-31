# setup and manage tt-rss

## required pillars

  tt-rss:
    base_dir: "/srv/tt-rss"
    cache_dir: "/srv/tt-rss-data"
    contrib_dir: "/srv/tt-rss-contrib"
    plugins:
      - {{ plugin_name }}
    {{ plugin_name }}:
      {{ plug_prop }}: {{ plug_val }}
