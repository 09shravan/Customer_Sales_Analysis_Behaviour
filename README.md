# 🛍️ Customer Shopping Behavior Dataset

A comprehensive retail dataset capturing customer demographics, purchase patterns, and behavioral attributes across 3,900 records. Ideal for exploratory data analysis, customer segmentation, and building recommendation or prediction models.

---

## 📊 Dataset Overview

| Property | Details |
|---|---|
| **File** | `shopping_behavior_updated.csv` |
| **Rows** | 3,900 |
| **Columns** | 18 |
| **Age Range** | 18 – 70 years |
| **Purchase Amount Range** | $20 – $100 USD |

---

## 🗂️ Column Descriptions

| Column | Type | Description |
|---|---|---|
| `Customer ID` | Integer | Unique identifier for each customer |
| `Age` | Integer | Customer age (18–70) |
| `Gender` | Categorical | Male / Female |
| `Item Purchased` | String | Name of the purchased item (e.g., Blouse, Jeans, Sneakers) |
| `Category` | Categorical | Product category: Clothing, Footwear, Accessories, Outerwear |
| `Purchase Amount (USD)` | Float | Transaction value in USD ($20–$100) |
| `Location` | String | US state of the customer |
| `Size` | Categorical | Item size: S, M, L, XL |
| `Color` | String | Color of the purchased item |
| `Season` | Categorical | Season of purchase: Spring, Summer, Fall, Winter |
| `Review Rating` | Float | Customer review score (scale of 1–5) |
| `Subscription Status` | Categorical | Whether the customer has an active subscription (Yes / No) |
| `Shipping Type` | Categorical | Shipping method: Standard, Express, Free Shipping, 2-Day Shipping, Next Day Air, Store Pickup |
| `Discount Applied` | Categorical | Whether a discount was applied (Yes / No) |
| `Promo Code Used` | Categorical | Whether a promo code was used (Yes / No) |
| `Previous Purchases` | Integer | Number of prior purchases by the customer |
| `Payment Method` | Categorical | Payment method: Credit Card, Debit Card, PayPal, Cash, Venmo, Bank Transfer |
| `Frequency of Purchases` | Categorical | Purchase frequency: Weekly, Bi-Weekly, Fortnightly, Monthly, Quarterly, Every 3 Months, Annually |

---

## 💡 Potential Use Cases

- **Customer Segmentation** — Cluster customers by demographics, spending habits, and purchase frequency
- **Purchase Prediction** — Predict purchase amount or category based on customer attributes
- **Recommendation Systems** — Suggest items based on past behavior, season, and preferences
- **Churn Analysis** — Identify patterns among subscribers vs. non-subscribers
- **Discount & Promo Effectiveness** — Analyze the impact of discounts and promo codes on purchase behavior
- **Seasonal Trend Analysis** — Explore how buying patterns shift across seasons

---

## 🚀 Getting Started

```python
import pandas as pd

df = pd.read_csv('shopping_behavior_updated.csv')
print(df.shape)      # (3900, 18)
print(df.head())
print(df.describe())
```

---

## 📁 Repository Structure

```
├── shopping_behavior_updated.csv   # Main dataset
├── README.md                       # Project documentation
└── notebooks/                      # (Optional) Analysis notebooks
```

---

## 📜 License

This dataset is intended for educational and research purposes.
