{% include "vars.sls" with context %}

"ttuser":
  user.present:
    - name: '{{ ttrss_user }}'
    - system: True

"ttgroup":
  group.present:
    - name: '{{ ttrss_group }}'
    - system: True

tt-rss:
  service.running:
    - require:
      - file: "/etc/default/tt-rss"
      - file: "/etc/init.d/tt-rss"
      - file: "/etc/tt-rss/*"
      - file: "{{ ttrss_base }}"
      - git: "{{ ttrss_app }}"
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
    - group: '{{ ttrss_group }}'
