if [ $1 == "docker" ]
then
        docker run -v $PWD:/mnt/ -t docker.io/bushlab/tfagnet:latest python3 /TFAGNet/code/run_tfagnet.py -v /mnt/$2 -t /mnt/$3 -b $4 -o $5
        docker run -v $PWD:/mnt/ -t docker.io/bushlab/tfagnet:latest chmod 777 -R /mnt/$5_results/
else
        singularity exec --bind $PWD:/mnt/ tfagnet_latest.sif python3 /TFAGNet/code/run_tfagnet.py -v /mnt/$2 -t /mnt/$3 -b $4 -o $5

fi
