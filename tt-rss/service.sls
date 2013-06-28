{% import "tt-rss/vars.sls" as ttrss with context %}

include:
  - tt-rss.user

tt-rss:
  service.running:
    - require:
      - file: "/etc/default/tt-rss"
      - file: "/etc/init.d/tt-rss"
      - file: "/etc/tt-rss/*"
      - file: "{{ ttrss.base }}"
      - git: "{{ ttrss.app }}"
    - watch:
      - file: "/etc/default/tt-rss"
      - file: "/etc/init.d/tt-rss"
      - file: "/etc/tt-rss/*"
      - file: "/srv/tt-rss/*"

"/etc/default/tt-rss":
  file.managed:
    - template: jinja
    - source:
      - "salt://tt-rss/static/default.{{ grains.id }}"
      - "salt://tt-rss/static/default.{{ grains.os }}"
      - "salt://tt-rss/static/default"

"/etc/init.d/tt-rss":
  file.managed:
    - template: jinja
    - source:
      - "salt://tt-rss/static/init.{{ grains.id }}"
      - "salt://tt-rss/static/init.{{ grains.os }}"
      - "salt://tt-rss/static/init"
    - mode: 770

"/etc/logrotate.d/tt-rss":
  file.managed:
    - template: jinja
    - source:
      - "salt://tt-rss/static/logrotate.{{ grains.id }}"
      - "salt://tt-rss/static/logrotate.{{ grains.os }}"
      - "salt://tt-rss/static/logrotate"

"{{ ttrss.run }}":
  file.directory:
    - mode: 755
    - user: "{{ ttrss.user }}"
    - group: "{{ ttrss.group }}"

"{{ ttrss.log }}":
  file.directory:
    - mode: 750
    - user: "{{ ttrss.user }}"
    - group: "{{ ttrss.group }}"

"{{ ttrss.lock }}":
  file.directory:
    - mode: 640
    - user: '{{ ttrss.user }}'
    - group: '{{ ttrss.group }}'
    - require:
      - file: "{{ ttrss.base }}"
      - user: "{{ ttrss.user }}"
      - group: "{{ ttrss.group }}"

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
