#!/bin/bash

OPASS_MAIN=/Overpass-API
BINDIR=$OPASS_MAIN/src/bin
EXECDIR=$OPASS_MAIN/src

# Kill all background processes on exit
trap "exit" INT TERM
trap "kill 0" EXIT

#If database doesn't exist, fetch the .osm and init the overpass db
if [ ! -e $DBDIR/nodes.bin ]; then
    echo "Database does not exist -- downloading clone"
	cd $DBDIR
	$BINDIR/download_clone.sh --db-dir=$DBDIR --source=$CLONE_SERVER --meta=no
fi


echo "Will run dispatcher"
$BINDIR/dispatcher --osm-base --meta --db-dir=$DBDIR &

echo "Will run diff fetcher"
$BINDIR/fetch_osc_and_apply.sh $REPLICATE_SERVER --meta=no &

while true; do
	sleep 2000;
done
