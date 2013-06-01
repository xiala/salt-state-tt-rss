
{% include "vars.sls" with context %}

"/etc/tt-rss/config.php":
  file.managed:
    - mode: 640
    - group: '{{ ttrss_group }}'
    - source:
      - "salt://tt-rss/static/conf/config.php.{{ grains.id }}"
      - "salt://tt-rss/static/conf/config.php.{{ grains.os }}"
      - "salt://tt-rss/static/conf/config.php"
    - require:
      - file: "/etc/tt-rss"

"/etc/tt-rss/database.php":
  file.managed:
    - mode: 640
    - group: '{{ ttrss_group }}'
    - source:
      - "salt://tt-rss/static/conf/database.php.{{ grains.id }}"
      - "salt://tt-rss/static/conf/database.php.{{ grains.os }}"
      - "salt://tt-rss/static/conf/database.php"
    - require:
      - file: "/etc/tt-rss"
