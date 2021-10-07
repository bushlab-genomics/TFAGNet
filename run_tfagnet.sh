docker run -v $1:/mnt/ -t docker.io/bushlab/tfagnet:latest python3 /TFAGNet/code/run_tfagnet.py -v /mnt/$2 -b $3 -o $4 
docker run -v $1:/mnt/ -t docker.io/bushlab/tfagnet:latest chmod 777 -R /mnt/$4_results/ 
