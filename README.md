# Movie Recommendation System

## Overview

This project implements a **content-based movie recommendation system** using **TF-IDF vectorization, sentence embeddings, and Agglomerative Clustering**. The system takes a user's query and returns **10 recommended movies**, ensuring diversity by selecting **66% from the top cluster and the remaining from other clusters**, so the user gets relevant as well as diverse recommendations.

## Features

- Uses **TF-IDF vectorization and sentence-transformers** for hybrid similarity calculation.
- Uses **Agglomerative Clustering** as it provided the best results compared to other clustering algorithms tested.
- Selects **66% of the desired number of recommendations from the top cluster** and the remaining from other clusters.
- Sorts results by **similarity score** (and rating in case of ties).
- Fully automated setup with virtual environment and Jupyter support.

## Dataset

The dataset contains **500 movies** from IMDb, including the following columns:

- `Movie Name` - Title of the movie
- `Rating` - IMDb rating
- `Genre` - Movie genres
- `Plot` - Short description of the movie
- `Directors` - Name(s) of the director(s)
- `Stars` - Main actors in the movie
- `Votes` - Number of IMDb votes

**Dataset Link:** [IMDb Best 500 Movies](https://www.kaggle.com/datasets/moazeldsokyx/the-500-best-movies-imdb)
**Note:** If you download data from the link dont forget to remove duplicates from dataset.

## Data Cleaning

Since the dataset is already preprocessed, no additional cleaning is required. However, for future dataset modifications, consider:

- Removing **missing values** from important fields like `Plot`, `Genre`, `Directors`, and `Stars`.
- Converting text fields to **lowercase** for consistency.
- Removing unnecessary whitespace and special characters.
- Ensuring **numerical values** like `Rating` and `Votes` are correctly formatted.
- Checking for duplicate entries and removing them if necessary.

## Installation

To set up the environment and install dependencies:

### **For Linux/macOS**

```bash
chmod +x setup.sh  # Give execution permission
./setup.sh         # Run the setup script
```

### **For Windows**

```bat
setup.bat
```

### **Manually (if needed)**

If you want to manually install dependencies without running the setup script:

```bash
python -m venv venv_recommender
source venv_recommender/bin/activate  # Windows: venv_recommender\Scripts\activate
pip install -r requirements.txt
python -m spacy download en_core_web_sm
python -m ipykernel install --user --name=venv_recommender --display-name "Python (venv_recommender)"
```

## Usage

### **Run Jupyter Notebook**

1. Activate the virtual environment:
   ```bash
   source venv_recommender/bin/activate  # Windows: venv_recommender\Scripts\activate
   ```
2. Start Jupyter Notebook:
   ```bash
   jupyter notebook
   ```
3. Open the notebook and select the kernel **Python (venv\_recommender)**.

### **Running Recommendations**

Inside the notebook, you can use the following function to get recommendations:

```python
user_query = "I love thrilling space adventures with unexpected twists"
recommendations = get_recommendations(user_query, tfidf_vectorizer, tfidf_matrix, model, movie_embeddings, df, total_n=10, alpha=0.3)
recommendations = sorted(recommendations, key=lambda row: row['similarity'], reverse=True)

for i, rec in enumerate(recommendations):
    print(f"{i+1}. {rec['Movie Name']} (Rating: {rec['Rating']}, Similarity: {rec['similarity']:.4f}, Cluster: {rec['cluster']})")
```

You can change total_n and alpha values to get more number of movies and change weights of tf-idf in similarity calculation accordingly.
This will return **10 recommended movies**, with **66% from the top cluster and the remaining from other clusters**, sorted by similarity.

## Clustering Algorithm Used

This project uses **Agglomerative Clustering**, as it provided the best performance in tests compared to other clustering methods.

## Evaluation

- The recommendation is based on a **hybrid similarity approach** using **TF-IDF similarity and dense sentence embeddings**.
- A weighted combination of TF-IDF and sentence-transformer similarity is used (`alpha` parameter controls the balance).
- If multiple movies have the same similarity, they are ranked by **IMDb rating**.
- The system ensures diversity by selecting movies from different clusters.

## Dependencies

- `pandas`
- `numpy`
- `spacy`
- `sentence-transformers`
- `scikit-learn`
- `jupyter`

## Notes

- Make sure to **activate the virtual environment** before running the notebook.
- The Jupyter kernel must be set to **Python (venv\_recommender)** for everything to work properly.

## Demonstration Video

A full **video demonstration** of running the Jupyter Notebook and obtaining recommendations can be found in `demo.md`. Follow the video to see step-by-step execution.

## License

This project is for educational purposes only. IMDb data is used under fair use for research and analysis.

---

Now, you're ready to **run the movie recommendation system** and explore movie recommendations! 🚀