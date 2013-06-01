<?php
{% import "tt-rss/vars.sls" as ttrss with context %}
{% set db = salt['pillar.get']('tt-rss:db', dict()) %}
$dbuser='{{ db.get('user', 'ttrss') }};
$dbpass='{{ db.get('pass', None) }}';
$basepath='{{ db.get('path', '') }}';
$dbname='{{ db.get('name', 'ttrss') }}';
$dbserver='{{ db.get('server', '') }}';
$dbport='{{ db.get('port', '') }}';
$dbtype='{{ db.get('type', 'pgsql') }}';

?>
