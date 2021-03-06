#!//bin/bash
set -euo pipefail

if [ -z $1 ]; then
	echo "The folder to process is required as parameter"
	exit 1;
fi

OUTPUT_FOLDER="/proj/b2012214/nobackup/private/metaphlan_maars"
echo "OUTPUT FOLDER $OUTPUT_FOLDER"

lib_dir=$1
lib_name=`expr match "$1" '.*\(B.Andersson_[0-9]\{2\}_[0-9]\{2\}/\?\)'`
echo "Library dir: $lib_dir"
echo "Library name: $lib_name"
cd $lib_dir

for sample_dir in `ls -d P*`;
do
	echo $sample_dir
	cd $sample_dir
	mkdir -p $OUTPUT_FOLDER/$lib_name/$sample_dir/reads
	ln -s -t $OUTPUT_FOLDER/$lib_name/$sample_dir/reads `pwd`/*.fastq.gz
	cd ..
done
