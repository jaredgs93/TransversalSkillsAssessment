# Transversal Skills Assessment
A Multimodal Artificial Intelligence Platform for Comprehensive Transversal Skills Assessment

This repository provides a system for evaluating skills using a multimodal approach. It includes a REST API and two Streamlit-based user interfaces:
1. **User Interface for Video Evaluation**: Allows users to upload videos, process them, and generate detailed evaluation reports. These reports can be downloaded as PDFs or sent via email.
2. **Rules Creation Interface**: Enables users to create and manage evaluation rules, defining the antecedents and consequents for skill assessment.

## Prerequisites

- **Docker** installed on your machine.
- An **OpenAI API Key** for accessing OpenAI services.
- A **Gmail account** with an App Password enabled. This is required for sending reports via email, as the system is currently designed to use Gmail's SMTP server.

### How to Get Your OpenAI API Key

1. Go to the [OpenAI API Keys](https://platform.openai.com/account/api-keys) page.
2. Sign in or create an OpenAI account if you don’t already have one.
3. Click "Create new secret key" to generate a new API key.
4. Copy the API key and paste it into the `OPENAI_API_KEY` field in your `.env` file.

### Steps to Create an App Password for Gmail

1. Enable Two-Step Verification
   - Go to your [Google Account](https://myaccount.google.com/).
   - Click on **Security** in the left menu.
   - Under the **How you sign in to Google**, enable **2-Step Verification** if it’s not already activated.
   - Follow the instructions to set up 2-Step Verification (you can use text messages, apps like Google Authenticator, or physical security keys).

2. Access the App Passwords Section
   - Once **2-Step Verification** is enabled, [login to create and manage application passwords](https://myaccount.google.com/apppasswords).
   - In the **To create a new app-specific password, type a name for it below…** enter a descriptive name like `DockerApp`.
  - Click **Create**.

3. Copy the Generated Password
   - A 16-character password will appear in a pop-up window.
   - Copy this password. It will only be shown once, so make sure to save it securely.
---

## Building and Running the Docker Image
### 1. Clone the Repository
Start by cloning the repository and pulling the required files (including those managed by Git LFS):
```bash
git clone
cd TransversalSkillsAssessment
git lfs install
git lfs pull
```

### 2. Create the `.env` File

In the `src` folder, create a `.env` file with the following content:

```plaintext
OPENAI_API_KEY=your_openai_api_key
EMAIL_USER=your_gmail_address
EMAIL_PASSWORD=your_app_password
```

### 3. Build and Run the Services
Use `docker-compose` to build and run the services. This command will build the Docker images and start all necessary containers:
```bash
docker-compose up --build
```
### 4. Access the Services
Once the containers are running, you can access the following services:
- **API**: `http://<SERVER_IP>:8000`
- **Rules Creation Interface**: `http://<SERVER_IP>:8501`
- **User Interface**: `http://<SERVER_IP>:8502`

Replace `<SERVER_IP>` with:

- `localhost` if running locally.
- The public IP address or domain name of your server if running remotely.

### 5. Stop the Services
To stop the containers and free resources, use:
```
docker-compose down
```
---
## How to Use
### Video evaluation
#### 1. Access the User Interface
- Access the interface at `http://<SERVER_IP>:8502`, replacing `<SERVER_IP>` with:
  - `localhost` if running locally.
  - The public IP address or domain name of the server if running remotely (e.g., `http://123.45.67.89:8502`).
#### 2. Upload a Video
- Enter the video URL you want to evaluate.
- Provide the topic for evaluation in the text input field.
- Click **Upload Video URL** to start the evaluation process.

#### 2. Process the Video
The backend API processes the video, evaluates skills, and generates a detailed report.

#### 3. Download or Email the Report
- Download the report as a PDF.
- Optionally, send the report to an email address.

### Rules creation
#### 1. Access the User Interface
- Access the interface at `http://<SERVER_IP>:8501`, replacing `<SERVER_IP>` with:
  - `localhost` if running locally.
  - The public IP address or domain name of the server if running remotely (e.g., `http://123.45.67.89:8501`).

#### 2. Create a New Rule
- Fill in the **Antecedents**:
  - Select the desired conditions from the dropdowns for each antecedent (e.g., Gaze, Voice Uniformity, Serenity).
  - Specify if the condition **IS** or **IS NOT** met.
  - Enter a value for the condition (e.g., Centered, Low).
  - Choose an **Operator** (e.g., AND, OR) to combine antecedents.

- Define the **Consequent**:
  - Specify the resulting skill and its value (e.g., Leadership Security is Low).

#### 3. Save the Rule
- Click the "Save Rule" button to store the new rule.
- A confirmation message, "Rule saved successfully!", will appear upon successful saving.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.



