# Conversational Analytics for Research Papers Based on Semantic Parsing with SQL Generation 

This is the code repository for the master thesis research paper "Conversational Analytics for Research Papers Based on Semantic Parsing with SQL Generation" implemented within the scope of master studies at the Berlin School of Economics in Law. This code repository predominantly incorporated the source code from two research papers:
- Xi Victoria Lin, Richard Socher and Caiming Xiong. [Bridging Textual and Tabular Data for Cross-Domain Text-to-SQL Semantic Parsing](https://github.com/salesforce/TabularSemanticParsing)
- Tao Yu, Rui Zhang, Kai Yang,Michihiro Yasunaga, Dongxu Wang, Zifan Li, James Ma, Irene Li, Qingning Yao, Shanelle Roman, Zilin Zhang, Dragomir R. Radev.
[Spider: A Large-Scale Human-Labeled Dataset for Complex and Cross-Domain Semantic Parsing and Text-to-SQL Task](https://github.com/taoyds/spider)

## Overview

Text-to-SQK semantic parsing concerns itself with the task of converting a question in the form of natural language utterance to the logical form of the SQL query understood by computers.

This code repository imports and evaluates a sequence-to-sequence BRIDGE semantic parsing model that has achieved state-of-the-art performance on two commonly used benchmark datasets in the field of text-to-SQL semantic parsing: [Spider](https://yale-lily.github.io/spider) and [WikiSQL](https://github.com/salesforce/WikiSQL). Since training and testing is out of the scope for the WikiSQL dataset, some parts of it were excluded from the imported source code. The sourced BRIDGE code repository also includes an SQL preprocessing and parsing functions  [SQL processing tools](moz_sp) adapted from the [Moz SQL Parser](https://github.com/mozilla/moz-sql-parser).

Similar to the original code package of the BRIDGE model, this package is designed to be run in the command line with instructions presented below on how to complete training, testing and demo of the natural language interface.

## Models

Model 1 uses BRIDGE model as the base of its architecture. It is trained on the cross-domain Spider dataset, fine-tuned on the ISRECON schema which is included in the tables.json file. The checkpoint of the Model 1 is available [in this link](https://drive.google.com/file/d/1VDMdMiySbEb0c3FJutE106SaWW5UWRRs/view?usp=sharing).

Model 2 is further fine-tuned both on the ISRECON schema as well as small set of annotated question-SQL pairs. The checkpoint of the Model 2 is available [in this link](https://drive.google.com/file/d/1HmkVp4M41bMtr6XuB9FrVQctqvHFw622/view?usp=sharing).


## Data

The model incorporates the new schema of the ISRECON database which is available on the university Plato server in the following directory: "/home/shelunts/thesis/TabularSemantingParsing/data/isrecon/isrecon/isrecon.sqlite". After downloading the database, move it into the relevant directory.

```
mv isrecon.sqlite data/isrecon/isrecon/ 

```


- **Preprocessing:** Preprocessing and parsing of SQL queries is completed in the notebooks in the [preprocess_inputs directory](/home/shelunts/thesis/TabularSemantingParsing/preprocess_inputs).
- **Evaluation:** Model testing is done by running the relevant command line commands according to the instructions specified in the [official implementation of the BRIDGE model](https://github.com/salesforce/TabularSemanticParsing). Afterwards, the results evaluation and analysis is completed in the notebooks in the [evaluation_isrecon directory](/home/shelunts/thesis/TabularSemantingParsing/evaluation_isrecon).

**Note:** 
There is a potential bug in the sql token parser which fails to extract foreign keys from ISRECON database. Those were added manually. The updated schema is available in the table.json file in the directory "data/spider".

### Install Dependencies

The package was tested and run using Cuda 11.0 with a single GPU.
```
git clone [put the link to the git code here]
cd TabularSemanticParsing

pip install torch torchvision
python3 -m pip install -r requirements.txt
```

### Set up Environment
```
export PYTHONPATH=`pwd` && python -m nltk.downloader punkt
```

### Process Data


Processed different train, test sets and schemas of ISRECON as well as Spider dataset are available in the json files under the directory data/spider. Please refer to the the notebooks in the folder preprocess_inputs to check how preprocessing was completed. Make sure that the relevant train and test files for model training and testing are available under the name of "train.json" and "dev.json" respectively. Then run the following command to generate a pickled preprocessed file for later usage in the model training. 

```
./experiment-bridge.sh configs/bridge/spider-bridge-bert-large.sh --process_data 0

```


### Test
To test the model run the following command. Evaluation results will be outputted out at the end the testing run.

```
./experiment-bridge.sh configs/bridge/spider-bridge-bert-large.sh --inference 0

```

### Train 

In case of training the model all over again use the command below. Please note that in case of checkpoint import into the directory, the training is not needed anymore. In that case, just preprocess the data as described in the command prompt above and run the test command.

```
./experiment-bridge.sh configs/bridge/spider-bridge-bert-large.sh --train 0 --checkpoint_path [path_to_model_checkpoint_tar_file]

```

### Commandline Demo
Interaction with pre-trained checkpoint is possible through the commandline:

```
./experiment-bridge.sh configs/bridge/spider-bridge-bert-large.sh --demo 0 --demo_db isrecon --checkpoint_path [path_to_checkpoint_tar_file]
```


## References

```
@inproceedings{LinRX2020:BRIDGE, 
  author = {Xi Victoria Lin and Richard Socher and Caiming Xiong}, 
  title = {Bridging Textual and Tabular Data for Cross-Domain Text-to-SQL Semantic Parsing}, 
  booktitle = {Proceedings of the 2020 Conference on Empirical Methods in Natural
               Language Processing: Findings, {EMNLP} 2020, November 16-20, 2020},
  year = {2020} 
}
```

```
@inproceedings{Yu&al.18c,
  title     = {Spider: A Large-Scale Human-Labeled Dataset for Complex and Cross-Domain Semantic Parsing and Text-to-SQL Task},
  author    = {Tao Yu and Rui Zhang and Kai Yang and Michihiro Yasunaga and Dongxu Wang and Zifan Li and James Ma and Irene Li and Qingning Yao and Shanelle Roman and Zilin Zhang and Dragomir Radev}
  booktitle = "Proceedings of the 2018 Conference on Empirical Methods in Natural Language Processing",
  address   = "Brussels, Belgium",
  publisher = "Association for Computational Linguistics",
  year      = 2018
}
```
