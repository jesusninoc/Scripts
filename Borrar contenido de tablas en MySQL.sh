#!/bin/bash

caches="cache \
cache_admin_menu \
cache_block \
cache_content \
cache_filter \
cache_menu \
cache_page \
cache_tax_image \
cache_update \
cache_views \
cache_views_data"

for cache in $caches
do
	echo "Cleaning $cache..."
	mysql -e "DELETE FROM basedatos.$cache where expire < UNIX_TIMESTAMP(NOW())"
	sleep 1
done

exit 0

caches="cache_filter"
for cache in $caches
do
	echo "Truncate $cache..."
	mysql -e "truncate table basedatos.$cache"
	sleep 1
done

echo "Done!"
exit 0
