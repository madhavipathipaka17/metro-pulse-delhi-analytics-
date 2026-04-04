# 🚇 Metro Pulse Delhi Analytics

## 📌 Project Overview

**Metro Pulse Delhi Analytics** is a data analytics project focused on understanding metro travel patterns in Delhi. The project involves cleaning raw trip data, storing it in a structured SQL database, and performing analytical queries to extract meaningful insights about passenger demand, revenue trends, and travel behavior.

---

## 🎯 Expected Results

This project delivers:

* ✅ A cleaned metro travel dataset
* ✅ A structured SQL database
* ✅ 20 analytical SQL queries
* ✅ Insights into:

  * Passenger demand
  * Revenue trends
  * Travel behavior

---

## 📦 Deliverables

The final project includes:

* 📁 Cleaned CSV dataset
* 🗄️ SQL table schema
* 🐍 Python data cleaning script
* 🧠 SQL queries used for analysis
* 📄 Project documentation report
* 📂 Proper GitHub project structure

---

## 📁 Project Structure

```
metro-pulse-delhi-analytics/
│
├── source_data/
│       └── delhi_metro_trips.json
│
├── cleaned_data/
│       └── delhi_metro_trips.csv
│
├── sql/
│       ├── schema.sql
│       └── queries.sql
│
├── src/
│       └── data_cleaning.py
│
├── README.md
├── requirements.txt
└── .gitignore
```

---

## ⚙️ Tech Stack

* **Python** → Data cleaning & preprocessing
* **Pandas / NumPy** → Data manipulation
* **SQL** → Data storage & analysis
* **Git & GitHub** → Version control

---

## 🔄 Workflow

1. **Raw Data Collection**

   * JSON dataset containing metro trip data

2. **Data Cleaning (Python)**

   * Handle missing values
   * Standardize column formats
   * Remove duplicates
   * Export cleaned CSV

3. **Database Creation (SQL)**

   * Define schema
   * Import cleaned dataset into SQL table

4. **Data Analysis**

   * Write and execute analytical SQL queries
   * Extract insights

---

## 📊 Key Analysis Areas

* 🚉 Most popular metro routes
* 💰 Highest revenue-generating routes
* 📅 Monthly passenger trends
* 🎟️ Ticket type performance
* 📍 Station-level demand analysis

---

## 🚀 How to Run the Project

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/metro-pulse-delhi-analytics.git
cd metro-pulse-delhi-analytics
```

### 2. Install Dependencies

```bash
pip install -r requirements.txt
```

### 3. Run Data Cleaning Script

```bash
python src/data_cleaning.py
```

### 4. Execute SQL Scripts

* Run `schema.sql` to create tables
* Run `queries.sql` to perform analysis

---

