{% import "tt-rss/vars.sls" as ttrss with context %}

"ttuser":
  user.present:
    - name: '{{ ttrss.user }}'
    - system: True

"ttgroup":
  group.present:
    - name: '{{ ttrss.group }}'
    - system: True

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
    - source:
      - "salt://tt-rss/static/default.{{ grains.id }}"
      - "salt://tt-rss/static/default.{{ grains.os }}"
      - "salt://tt-rss/static/default"

"/etc/init.d/tt-rss":
  file.managed:
    - source:
      - "salt://tt-rss/static/init.{{ grains.id }}"
      - "salt://tt-rss/static/init.{{ grains.os }}"
      - "salt://tt-rss/static/init"
    - mode: 770

"/etc/logrotate.d/tt-rss":
  file.managed:
    - source:
      - "salt://tt-rss/static/logrotate.{{ grains.id }}"
      - "salt://tt-rss/static/logrotate.{{ grains.os }}"
      - "salt://tt-rss/static/logrotate"

"/etc/tt-rss":
  file.directory:
    - mode: 640
    - user: root
    - group: '{{ ttrss.group }}'

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
