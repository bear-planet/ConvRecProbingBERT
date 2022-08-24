# python run_dialogue_baseline.py \ 
#     --task music \ 
#     --data_folder C:/Users/eric8/Desktop/Yusha/ConvRecProbingBERT/data/dialogue/ \ 
#     --seed 42 \
#     --ranker bert \ 
#     --output_dir C:/Users/eric8/Desktop/Yusha/ConvRecProbingBERT/data/output_data/bert4dialogue \ 
#     --early_stopping_steps 100000 \ 
#     --logging_steps 200000 \ 
#     --learning_rate 5e-6 \ 
#     --num_epochs 1 \ 
#     --bert_model bert-base-cased

# _pickle.PicklingError: Can't pickle <function beat_interval_option at 0x000001AB4CE7F8B8>: it's not the same object as sacred.commandline_options.beat_interval_option

for SEED in 42 1 2 3 4
# for SEED in 42
do
    python run_dialogue_baseline.py --task books --data_folder C:/Users/eric8/Desktop/Yusha/ConvRecProbingBERT/data/dialogue/ --seed $SEED --ranker bert --output_dir C:/Users/eric8/Desktop/Yusha/ConvRecProbingBERT/data/output_data/bert4dialogue --early_stopping_steps 100000 --logging_steps 200000 --learning_rate 5e-6 --num_epochs 1 --bert_model bert-base-cased
done
