if [ $1 == "docker" ]
then
        docker run -v $PWD:/mnt/ -t docker.io/bushlab/tfagnet:latest python3 /TFAGNet/code/run_tfagnet.py -v /mnt/$2 -b $3 -o $4
        docker run -v $PWD:/mnt/ -t docker.io/bushlab/tfagnet:latest chmod 777 -R /mnt/$4_results/
else
        singularity exec --bind $PWD:/mnt/ tfagnet_latest.sif python3 /TFAGNet/code/run_tfagnet.py -v /mnt/$2 -b $3 -o $4

fi


