# 👩‍💼 HR Employee Information Form (R Shiny App)

An interactive **HR data entry and management web application** built using **R Shiny**.  
This app allows users to input, validate, and manage employee information through a structured and user-friendly interface.

It demonstrates form handling, input validation, and dynamic data display in real-time.

---

## 🚀 Key Features

📝 Comprehensive employee data entry form  
✅ Input validation (age constraints)  
📊 Dynamic display of submitted data  
📂 File upload support (Resume / ID Proof)  
🔄 Reset form functionality  
⚡ Real-time interaction with user inputs  
🎯 Clean and responsive UI  

---

## 🛠️ Technologies Used

- 🟢 **R Programming Language**  
- 📦 **Shiny**  
- 🎨 **shinyWidgets**  

---

## 📂 Project Structure

- `app.R` → Main Shiny application file  

---

## ⚙️ Application Functionality

The application consists of two main components:

---

### 🔹 1. User Interface (UI)

The sidebar panel contains all input fields for employee data:

#### 📋 Input Fields

- **Employee Name** → Text input  
- **Personal Story** → Multi-line text area  
- **Secret Information** → Password field  
- **Age** → Numeric input (restricted between 18–55)  
- **Years of Experience** → Slider input  
- **Contract Duration** → Range slider (months)  
- **Date of Birth** → Date picker  
- **Vacation Period** → Date range selector  
- **Programming Languages** → Multi-select dropdown  
- **Hobbies** → Checkbox group  
- **Side Job Availability** → Boolean checkbox  
- **File Upload** → Resume / ID proof  

---

### 🔹 2. Server Logic

The server handles all interactions and outputs:

#### ✅ Submit Button

- Validates age:
  - Must be ≥ 18  
  - Must be ≤ 55  
- Displays a **success popup modal**  
- Shows entered data in a structured table  

---

#### 📊 Data Display

- Displays submitted employee data in table format  
- Combines multiple inputs (e.g., hobbies, languages) into readable format  

---

#### 📂 File Upload Handling

- Displays uploaded file details:
  - File name  
  - File type  
  - File size  

---

#### 🔄 Cancel Button

- Resets all input fields to default values  
- Clears user-entered data  

---

#### 🏠 Home Button

- Displays a placeholder modal  
- Can be extended for navigation or dashboard integration  

---
## 🖼️ Application Screenshots

<img width="1920" height="1080" alt="Screenshot 2026-03-28 225728" src="https://github.com/user-attachments/assets/86ab1da3-1470-4e24-bc6e-7ae145d0ded8" />
<img width="1920" height="541" alt="Screenshot 2026-03-28 225805" src="https://github.com/user-attachments/assets/dd4c6271-aa6d-42b4-ad05-2e70ca85055b" />

---
## 🎮 How to Run the App

### Step 1: Install Required Packages

```r
install.packages(c("shiny", "shinyWidgets"))
```
---
## 🎯 Purpose of the Project
- Demonstrate form handling in R Shiny
- Implement input validation
- Manage and display user input dynamically
- Build interactive web-based data entry systems
---
## 👩‍💻 Author

Fatima Sohail
---
## ⭐ Notes
- This project is created for academic purposes
- Can be extended into a complete HR management system
---
