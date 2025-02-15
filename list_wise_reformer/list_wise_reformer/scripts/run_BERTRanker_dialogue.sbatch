#!/bin/sh

#SBATCH --partition=general
#SBATCH --qos=long
#SBATCH --time=15:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:2
#SBATCH --mem-per-cpu=14000
#SBATCH --mail-type=END

module use /opt/insy/modulefiles
module load cuda/10.0 cudnn/10.0-7.4.2.24
source /home/nfs/gustavopenha/env_slice_learning/bin/activate

REPO_DIR=/tudelft.net/staff-umbrella/conversationalsearch/recsys2020penha

#Either uncomment the following, or call this using run_all_dialogue_baselines.sh
# TASK=music
# TASK=books
# TASK=movies
TASK=redial

for SEED in 1 2 3 4
# for SEED in 42
do
  srun python run_dialogue_baseline.py \
    --task $TASK \
    --data_folder $REPO_DIR/data/dialogue/ \
    --seed $SEED \
    --ranker bert \
    --output_dir $REPO_DIR/data/output_data/bert4dialogue \
    --early_stopping_steps 100000 \
    --logging_steps 200000 \
    --learning_rate 5e-6 \
    --num_epochs 1 \
    --bert_model 'bert-base-cased' 
    
done

python run_dialogue_baseline.py --task music --data_folder D:/ConvRecProbingBERT/data/dialogue/ --seed 42 --ranker bert --output_dir D:/ConvRecProbingBERT/data/output_data/bert4dialogue --early_stopping_steps 100000 --logging_steps 200000 --learning_rate 5e-6 --num_epochs 1 --bert_model bert-base-cased --batch_size 1
python run_dialogue_baseline.py --task music --data_folder C:/Users/eric8/Desktop/Yusha/ConvRecProbingBERT/data/dialogue/ --seed 42 --ranker bert --output_dir C:/Users/eric8/Desktop/Yusha/ConvRecProbingBERT/data/output_data/bert4dialogue --early_stopping_steps 100000 --logging_steps 200000 --learning_rate 5e-6 --num_epochs 1 --bert_model bert-base-cased

########### Result #############
# Seed = 42 | Task = Music
# 2022-08-01 20:51:35,166 [INFO] Evaluating BERTRanker
# 2022-08-01 20:51:35,166 [INFO] recip_rank: 0.4320
# 2022-08-01 20:51:35,166 [INFO] ndcg_cut_10: 0.4826