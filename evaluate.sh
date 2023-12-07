
#!/bin/bash

# Download weights
if [ ! -f "weights/checkpoint_50.pth" ]; then
	gdown --id 1V8c8xkMrQaCnd3MVChvJ2Ge-DUfXPHNu & mv checkpoint_50_best.pth weights/checkpoint_50.pth
else 
	echo "Weights downloaded already."
fi

# Download WIDER
if [ ! -d "data/WIDER/WIDER_val" ]; then
	gdown --id 1JnRyalYdTc692l4jx5SUN1-qRVvLtj5x & unzip data.zip -d data/WIDER/ & rm data.zip

else 
	echo "WIDER data downloaded already"
fi

# Install dependencies
pip install pyclust & pip install treelib & pip install pyclustering

# Evaluate Model
make evaluate
