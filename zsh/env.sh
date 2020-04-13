BASE_DIR=$(dirname $(readlink -f $0))
echo "==========================ENVS=========================="
 for f in $BASE_DIR/env/*; do
	 echo "\t load $f  env "
	 source $f;
 done

