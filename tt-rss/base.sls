{% set ttrss = pillar.get("ttrss", {}) -%}
{% set ttrss_base = ttrss.get("base", "/srv/tt-rss") -%}
{% set ttrss_app = ttrss.get("app", ttrss_base + "/www") -%}
{% set ttrss_cache = ttrss.get("cache", ttrss_base + "/data") -%}
{% set ttrss_user = ttrss.get('user', 'ttrss') -%}
{% set ttrss_group = ttrss.get('group', 'ttrss') -%}
{% set ttrss_db = ttrss.get('db', {}) -%}
{% set ttrss_db_user = ttrss_db.get('user', 'ttrss') -%}
{% set ttrss_db_pass = ttrss_db.get('pass', None) -%}
{% set ttrss_db_db = ttrss_db.get('db', 'ttrss') -%}


include:
  - postgres.ident
  - nginx.ssl
  - php.fpm
  - php.suhosin
  - php.mcrypt
  - php.curl

"{{ ttrss_user }}":
  user.present:
    system: True

"{{ ttrss_group }}":
  group.present:
    system: True

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
    - group: '{{ ttrss.group }}'

"/etc/tt-rss/config.php":
  file.managed:
    - source:
      - "salt://tt-rss/static/conf/config.php.{{ grains.id }}"
      - "salt://tt-rss/static/conf/config.php.{{ grains.os }}"
      - "salt://tt-rss/static/conf/config.php"

"/etc/tt-rss/database.php":
  file.managed:
    - source:
      - "salt://tt-rss/static/conf/database.php.{{ grains.id }}"
      - "salt://tt-rss/static/conf/database.php.{{ grains.os }}"
      - "salt://tt-rss/static/conf/database.php"

"{{ ttrss_base }}":
  file.directory: []

"{{ ttrss_app }}":
  git.latest:
    - name: "git@git.xiala.net:xiala-forks/tt-rss.git"
    - target: "{{ ttrss_app }}"
    - rev: "1.7.8"

"{{ ttrss_cache }}":
  file.directory:
    - mode: 640
    - user: '{{ ttrss_user }}'
    - group: '{{ ttrss_group }}'

"{{ ttrss_lock }}":
  file.directory:
    - mode: 640
    - user: '{{ ttrss_user }}'
    - group: '{{ ttrss_group }}'

"{{ ttrss_app }}/config.php":
  file.symlink:
    - target: "/etc/tt-rss/config.php"

# database setup
"{{ ttrss_db_user }}":
  postgres_user.present:
    - password: "{{ ttrss_db_pass }}"


"{{ ttrss_db_db }}"
  postgres_database.present:
    - owner: "{{ ttrss_db_user }}"
    - require:
      postgres_user: "{{ ttrss_db_user }}"
