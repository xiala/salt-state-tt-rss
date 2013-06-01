{% set ttrss = pillar.get("ttrss", {}) -%}
{% set ttrss_base = ttrss.get("base", "/srv/tt-rss") -%}
{% set ttrss_app = ttrss.get("app", ttrss_base + "/www") -%}
{% set ttrss_cache = ttrss.get("cache", ttrss_base + "/data") -%}
{% set ttrss_lock = ttrss.get('lock', ttrss_base + "/lock") -%}
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

"/etc/tt-rss/config.php":
  file.managed:
    - source:
      - "salt://tt-rss/static/conf/config.php.{{ grains.id }}"
      - "salt://tt-rss/static/conf/config.php.{{ grains.os }}"
      - "salt://tt-rss/static/conf/config.php"
    - require:
      - file: "/etc/tt-rss"

"/etc/tt-rss/database.php":
  file.managed:
    - source:
      - "salt://tt-rss/static/conf/database.php.{{ grains.id }}"
      - "salt://tt-rss/static/conf/database.php.{{ grains.os }}"
      - "salt://tt-rss/static/conf/database.php"
    - require:
      - file: "/etc/tt-rss"

"{{ ttrss_base }}":
  file.directory: []

"{{ ttrss_app }}":
  git.latest:
    - name: "git@git.xiala.net:xiala-forks/tt-rss.git"
    - target: "{{ ttrss_app }}"
    - rev: "1.7.8"
    - require:
      - file: "{{ ttrss_base }}"

"{{ ttrss_cache }}":
  file.directory:
    - mode: 640
    - user: '{{ ttrss_user }}'
    - group: '{{ ttrss_group }}'
    - require:
      - file: "{{ ttrss_base }}"

"{{ ttrss_lock }}":
  file.directory:
    - mode: 640
    - user: '{{ ttrss_user }}'
    - group: '{{ ttrss_group }}'
    - require:
      - file: "{{ ttrss_base }}"

"{{ ttrss_app }}/config.php":
  file.symlink:
    - target: "/etc/tt-rss/config.php"
    - require:
      - file: "/etc/tt-rss/config.php"
      - file: "{{ ttrss_base }}"
      - git: "{{ ttrss_app }}"

# database setup
"ttrss_db_user":
  postgres_user.present:
    - name: '{{ ttrss_db_user }}'
    - password: "{{ ttrss_db_pass }}"


"ttrss_db_db":
  postgres_database.present:
    - name: '{{ ttrss_db_db }}'
    - owner: "{{ ttrss_db_user }}"
    - require:
      - postgres_user: "{{ ttrss_db_user }}"
