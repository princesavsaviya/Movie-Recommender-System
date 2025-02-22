#!/bin/bash

# Create a virtual environment
python3 -m venv venv_recommender

# Activate the virtual environment
source venv_recommender/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install required dependencies
pip install -r requirements.txt

# Download spaCy model
python -m spacy download en_core_web_sm

# Install Jupyter and add the virtual environment to Jupyter
pip install ipykernel
python -m ipykernel install --user --name=venv_recommender --display-name "Python (venv_recommender)"

echo "Setup completed! To activate the virtual environment in Jupyter Notebook:"
echo "1. Open Jupyter Notebook"
echo "2. Select 'Python (venv_recommender)' as the kernel"
