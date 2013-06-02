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

include:
  - tt-rss.user
  - tt-rss.config

"{{ ttrss.base }}":
  file.directory: []

"{{ ttrss.app }}":
  git.latest:
    - name: "git@git.xiala.net:xiala-forks/tt-rss.git"
    - target: "{{ ttrss.app }}"
    - rev: "1.7.8"
    - require:
      - file: "{{ ttrss.base }}"

"{{ ttrss.cache }}":
  file.directory:
    - mode: 750
    - user: '{{ ttrss.user }}'
    - group: '{{ ttrss.group }}'
    - require:
      - file: "{{ ttrss.base }}"
      - user: "{{ ttrss.user }}"
      - group: "{{ ttrss.group }}"

"{{ ttrss.cache }}/images":
  file.directory:
    - mode: 750
    - user: '{{ ttrss.user }}'
    - group: '{{ ttrss.group }}'
    - require:
      - file: '{{ ttrss.cache }}'

"{{ ttrss.cache }}/export":
  file.directory:
    - mode: 750
    - user: '{{ ttrss.user }}'
    - group: '{{ ttrss.group }}'
    - require:
      - file: '{{ ttrss.cache }}'

"{{ ttrss.cache }}/js":
  file.directory:
    - mode: 750
    - user: '{{ ttrss.user }}'
    - group: '{{ ttrss.group }}'
    - require:
      - file: '{{ ttrss.cache }}'

"{{ ttrss.lock }}":
  file.directory:
    - mode: 640
    - user: '{{ ttrss.user }}'
    - group: '{{ ttrss.group }}'
    - require:
      - file: "{{ ttrss.base }}"
      - user: "{{ ttrss.user }}"
      - group: "{{ ttrss.group }}"

"{{ ttrss.app }}/config.php":
  file.symlink:
    - target: "/etc/tt-rss/config.php"
    - require:
      - file: "/etc/tt-rss/config.php"
      - file: "{{ ttrss.base }}"
      - git: "{{ ttrss.app }}"

"{{ ttrss.app }}/feed-icons":
  file.directory:
    - mode: 755
    - user: 'ttrss.user'
    - group: 'ttrss.group'
    - require:
      - git: "{{ ttrss.app }}"

