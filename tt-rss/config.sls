{% import "tt-rss/vars.sls" as ttrss with context %}

# for debug varset
# ttrss
#   base = {{ ttrss.base }}
#   app = {{ ttrss.app }}
#   cache = {{ ttrss.cache }}
#   lock = {{ ttrss.lock }}
#   user = {{ ttrss.user }}
#   group = {{ ttrss.group }}
#   db
#     user = {{ ttrss.db_user }}
#     pass = {{ ttrss.db_pass }}
#     db = {{ ttrss.db_db }}

"/etc/tt-rss":
  file.directory:
    - mode: 750
    - user: root
    - group: '{{ ttrss.group }}'

"/etc/tt-rss/config.php":
  file.managed:
    - mode: 640
    - group: '{{ ttrss.group }}'
    - template: jinja
    - source:
      - "salt://tt-rss/static/conf/config.php.{{ grains.id }}"
      - "salt://tt-rss/static/conf/config.php.{{ grains.os }}"
      - "salt://tt-rss/static/conf/config.php"
    - require:
      - file: "/etc/tt-rss"

"/etc/tt-rss/database.php":
  file.managed:
    - mode: 640
    - group: '{{ ttrss.group }}'
    - template: jinja
    - source:
      - "salt://tt-rss/static/conf/database.php.{{ grains.id }}"
      - "salt://tt-rss/static/conf/database.php.{{ grains.os }}"
      - "salt://tt-rss/static/conf/database.php"
    - require:
      - file: "/etc/tt-rss"
