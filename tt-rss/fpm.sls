{% import "tt-rss/vars.sls" as ttrss with context -%}

"/etc/php/fpm/pool.d/tt-rss.conf":
  file.managed:
    - source:
      - "salt://tt-rss/static/fpm_pool.conf.{{ grains.id }}"
      - "salt://tt-rss/static/fpm_pool.conf.{{ grains.os }}"
      - "salt://tt-rss/static/fpm_pool.conf"
    - template: jinja

"{{ ttrss.sessions }}":
  file.directory:
    - mode: 750
    - user: '{{ ttrss.user }}'
    - group: '{{ ttrss.group }}'
    - makedirs: True

