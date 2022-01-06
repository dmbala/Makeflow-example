Basic job is to run the script "myexe.sh" on "sample.pdb" and produce the output file "output.txt".
./myexe.sh sample.pdb > output.txt
The script does simple word count on the pdb file, a dummy job.

The makeflow rule for the above execution is

output.txt: sample.pdb
   ./myexe.sh sample.pdb > output.txt

There are two lines in the above description. The first line defines input and output dependecies. First you provide the output file and then list the input files after the colon (:). The second line is the shell execution command.

Now we want to run the above script on several pdb files in the directory "Input" and write the output to the directory "Output". It is best if we can utilize a generator script for this purpose.

In this example, we have a script "./generator.sh" that will create the workflow. Run this like
./generator.sh > simple_example_slrm.mf

The Slurm batch options are specified in the top line of the file "simple_example_slrm.mf". Now to submit this on Amarel, do the following steps.

module use /project/community/modulefiles
module load cctools

We need to launch the workflow in the screen session or tmux session.
screen
makeflow -T slurm -J 400 ./sample_example_slrm.mf &

