// OP1: insertMany() — insert all 3 documents
db.products.insertMany([
  {
    product_id: 101,
    product_name: "Smartphone X Pro",
    category: "Electronics",
    brand: "TechNova",
    price: 59999,
    specifications: {
      warranty_years: 2,
      voltage: "220V",
      battery: "5000mAh",
      processor: "Octa-core"
    },
    features: ["5G Enabled", "AMOLED Display", "Fast Charging"],
    stock: 50
  },
  {
    product_id: 202,
    product_name: "Men's Casual Shirt",
    category: "Clothing",
    brand: "StyleWear",
    price: 1499,
    specifications: {
      size: ["S", "M", "L", "XL"],
      material: "Cotton",
      fit: "Regular",
      color: "Blue"
    },
    available_colors: ["Blue", "Black", "White"],
    stock: 120
  },
  {
    product_id: 303,
    product_name: "Organic Almonds",
    category: "Groceries",
    brand: "NatureFresh",
    price: 899,
    specifications: {
      expiry_date: new Date("2026-12-31"),
      weight: "500g",
      is_organic: true
    },
    nutritional_info: {
      calories: 579,
      protein: "21g",
      fat: "50g",
      fiber: "12g"
    },
    storage_instructions: [
      "Keep in a cool, dry place",
      "Store in airtight container"
    ],
    stock: 200
  }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  "specifications.expiry_date": { $lt: new Date("2025-01-01") }
});

// OP4: updateOne() — add a discount_percent field to a specific product
db.products.updateOne(
  { product_id: 101 },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — create index on category field
db.products.createIndex({ category: 1 });

// Explanation:
// Creating an index on the 'category' field improves query performance,
// especially for frequent searches like filtering products by category.
// It reduces the time complexity of search operations by avoiding full collection scans.