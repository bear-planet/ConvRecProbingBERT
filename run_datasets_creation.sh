mkdir data/recommendation/gr
mkdir data/recommendation/ml25m
mkdir data/search/gr
mkdir data/search/ml25m

cd data/
sbatch create_dialogue_datasets.sbatch
sbatch create_recommendation_datasets.sbatch
sbatch create_search_datasets.sbatch