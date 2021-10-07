docker run -v /home/nxp225/:/mnt/ -t docker.io/bushlab/tfagnet:latest python3 /TFAGNet/code/run_tfagnet.py -v /mnt/$1 -b $2 -o $3 
docker run -v /home/nxp225/:/mnt/ -t docker.io/bushlab/tfagnet:latest chmod 777 -R /mnt/$3_results/ 
