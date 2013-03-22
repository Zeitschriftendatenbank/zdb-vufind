#!/bin/bash
RUN_CMD="java -server -Xms512m -Xmx512m -Dsolrmarc.solr.war.path=/var/lib/jetty/webapps/solr.war -Dsolr.core.name=biblio -Dsolrmarc.path=/usr/local/vufind/solrmarc -Dsolr.path=/usr/local/vufind/solr-4.1.0 -jar /usr/local/vufind/solrmarc/SolrMarc.jar vufind_titel_config.properties /home/zdb/data/zdbtitel1302vorutf8.mrc"
ERROR_LOG="/usr/local/vufind/solr-4.1.0/logs/solrmarc-error-log_titles"
IMPORT_LOG="/usr/local/vufind/solr-4.1.0/logs/solrmarc-import-log_titles"

exec > $IMPORT_LOG
exec 2> $ERROR_LOG
echo "Now Importing ..."
exec $RUN_CMD

exit 0