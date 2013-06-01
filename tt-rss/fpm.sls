{% import "tt-rss/vars.sls" as ttrss with context -%}

"/etc/php/fpm/pool.d/tt-rss.conf":
  file.managed:
    - template: jinja
    - source:
      - "salt://tt-rss/static/fpm_pool.ini.{{ grains.id }}"
      - "salt://tt-rss/static/fpm_pool.ini.{{ grains.os }}"
      - "salt://tt-rss/static/fpm_pool.ini"

"{{ ttrss.sessions }}":
  file.directory:
    - mode: 750
    - user: '{{ ttrss.user }}'
    - group: '{{ ttrss.group }}'
    - makedirs: True

