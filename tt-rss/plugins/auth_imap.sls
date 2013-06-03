{% import "tt-rss/vars.sls" as ttrss with context %}

"{{ ttrss.base }}/plugins/auth_imap":
  file.symlink:
    - target: "{{ ttrss.contrib }}/plugins/auth_imap"



