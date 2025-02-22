@echo off

REM Create a virtual environment
python -m venv venv_recommender

REM Activate the virtual environment
call venv_recommender\Scripts\activate

REM Upgrade pip
pip install --upgrade pip

REM Install required dependencies
pip install -r requirements.txt

REM Download spaCy model
python -m spacy download en_core_web_sm

REM Install Jupyter and add the virtual environment to Jupyter
pip install ipykernel
python -m ipykernel install --user --name=venv_recommender --display-name "Python (venv_recommender)"

echo Setup completed! To activate the virtual environment in Jupyter Notebook:
echo 1. Open Jupyter Notebook
echo 2. Select 'Python (venv_recommender)' as the kernel