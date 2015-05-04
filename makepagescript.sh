#!/bin/bash
for i in {1..230} 
	do echo "wget -O harvest/pages/1-$i.html http://www.albertasource.ca/placenames/resources/searchcontent.php?book=0&category_id=1&subcategory_id=0&keyword=&pageid=$i"
done
for i in {1..100} 
	do echo "wget -O harvest/pages/2-$i.html http://www.albertasource.ca/placenames/resources/searchcontent.php?book=0&category_id=2&subcategory_id=0&keyword=&pageid=$i"
done
for i in {1..102} 
	do echo "wget -O harvest/pages/3-$i.html http://www.albertasource.ca/placenames/resources/searchcontent.php?book=0&category_id=3&subcategory_id=0&keyword=&pageid=$i"
done
for i in {1..5} 
	do echo "wget -O harvest/pages/4-$i.html http://www.albertasource.ca/placenames/resources/searchcontent.php?book=0&category_id=4&subcategory_id=0&keyword=&pageid=$i"
done
for i in {1..6} 
	do echo "wget -O harvest/pages/5-$i.html http://www.albertasource.ca/placenames/resources/searchcontent.php?book=0&category_id=5&subcategory_id=0&keyword=&pageid=$i"
done
for i in {1..19} 
	do echo "wget -O harvest/pages/6-$i.html http://www.albertasource.ca/placenames/resources/searchcontent.php?book=0&category_id=6&subcategory_id=0&keyword=&pageid=$i"
done
for i in {1..5} 
	do echo "wget -O harvest/pages/7-$i.html http://www.albertasource.ca/placenames/resources/searchcontent.php?book=0&category_id=7&subcategory_id=0&keyword=&pageid=$i"
done
