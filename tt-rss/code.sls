
{% include "tt-rss/vars.sls" with context %}

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
