include:
  - tt-rss.base

{% ttrss_base = salt['pillar.get']('tt-rss:base', '/srv/tt-rss') -%}

"{{ ttrss_base }}/contrib":
  git.latest:
    - name: "git@git.xiala.net:xiala-forks/tt-rss-contrib.git"
    - target: "{{ ttrss_base }}/contrib"



