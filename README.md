# 📦 Logistics Delay Prediction & Performance Dashboard

An end-to-end data project where I combined **Machine Learning + Tableau** to predict logistics delays and analyze operational performance.

---

## 🎯 Business Problem
Logistics operations are experiencing high delay rates (~56.6%), leading to:

Poor on-time delivery performance
Increased operational costs
Lack of visibility into high-risk shipments

Additionally, there is no system to predict delays in advance, making it difficult to take proactive action.

---

## 🚀 What I Built

* Built a **Random Forest model** to predict logistics delays
* Generated **Delay Probability (0–1)** for each shipment
* Classified shipments into **High / Medium / Low Risk**
* Designed an **interactive Tableau dashboard** with KPIs, filters, and insights

---


---

## 🛠️ Tech Stack

| Tool | Purpose |
|---|---|
| Excel | Data cleaning & preprocessing |
| MySQL | Data storage & SQL analysis |
| Python (Pandas, Scikit-learn, Seaborn) | EDA + Machine Learning |
| Tableau Public | Interactive dashboard & visualization |
| GitHub | Version control & documentation |

---

---

## 🤖 Machine Learning Pipeline

### Data Processing

* Encoded categorical variables (Traffic Status)
* Removed unnecessary columns (Asset ID)
* Handled missing values

---

### Model Training

```python
model = RandomForestClassifier(n_estimators=100, random_state=42)
model.fit(X_train, y_train)
```

---

### Prediction

```python
df_original['Delay_Probability'] = model.predict_proba(X)[:,1]
```

---

### Risk Classification

```python
def risk(p):
    if p > 0.7:
        return "High Risk"
    elif p > 0.4:
        return "Medium Risk"
    else:
        return "Low Risk"
```

---

### Output Dataset

* Delay Probability
* Risk Level
* Used for Tableau dashboard

```python
df_original.to_csv("logistics_with_predictions.csv", index=False)
```

---

## 📊 Dashboard Overview

### 🔢 Key KPIs

* **Total Shipments:** 1,000
* **Total Delays:** 566
* **Delay Rate:** 56.6%
* **On-Time Rate:** 43.4%
* **Avg Waiting Time:** 35 mins
* **System Status:** 🔴 Critical
* **Variance vs Target:** +16.6%

---

## 📊 Insights from Dashboard

### 🔴 Risk Level Distribution

* High Risk: **502 shipments**
* Low Risk: **432 shipments**
* Medium Risk: **66 shipments**

👉 Majority of shipments fall into **high-risk category**

---

### ⏱️ Delay Probability by Hour

* Average Delay Probability: **56.8%**
* Lowest: **42.5% (around early hours)**
* Peak: **~65% (afternoon hours)**

👉 Delay risk increases significantly during mid-day

---

### 📈 Hourly Delay Trend

* Peak Delay: **69.44% (around 5 PM)**
* Lowest Delay: **43.75% (late evening)**
* Peak Delay Zone: **8 AM – 2 PM**

👉 Operational congestion during working hours drives delays

---

### 🚚 High-Risk Assets

Example:

* Truck_10 → Actual: 64.76% | Predicted: 59.70%
* Truck_3 → Actual: 62.37% | Predicted: 60.88%
* Truck_2 → Actual: 53.33% | Predicted: 53.22%

Prediction Error Range:

* Min: **-5.07%**
* Max: **+4.20%**

👉 Model predictions closely match real performance

---

### 🚦 Delay by Drivers

* Weather: **26.68%**
* Unknown: **25.97%**
* Traffic: **23.85%**
* Mechanical Failure: **23.50%**

👉 Weather and traffic are the top contributors

---

### 📦 Inventory vs Delay

* High Operational Load: **60.48% delay**
* Low Operational Load: **58.94% delay**
* Balanced Load: **53.56% delay**

👉 as per this dataset Higher load = higher delay probability

---

### 📉 Demand vs Delay

* No strong correlation observed (R² ≈ 0)

👉as per this dataset Demand does not directly drive delays

---

## Project Structure

```
smart-logistics-analytics/
├── kaggle data/
│   └── smart_logistics_dataset.csv
├── Excel/
│   └── logistics_data.csv
├── sql/
│   └── Smart_logistics.sql
├── python/
│   └── logistics_modeling.ipynb
│   └── logistic_predictions.ipynb
│       └── logistics_with_predictions.csv
├── dashboard/
│   └── Dashboard.png
├── images/
│   └── charts/
└── README.md
```

---

---

## 🔄 Workflow

```
Raw Data → Data Cleaning → ML Model → Delay Probability → Risk Classification → Tableau Dashboard
```

---

## 💡 Key Takeaways

* ML can predict delays with **high accuracy (low error range)**
* Peak delays occur during **working hours (8 AM – 5 PM)**
* **High-risk shipments dominate operations**
* External factors (weather, traffic) are major delay drivers
* Inventory load significantly impacts delay performance

---

## 📸 Dashboard

(Add Tableau Public link here)

---

## 🙌 About Me

Aspiring Data Analyst focused on:

* Data Visualization
* Machine Learning
* Business Insights

---

## ⭐ If you found this useful

Give it a ⭐ on GitHub!
