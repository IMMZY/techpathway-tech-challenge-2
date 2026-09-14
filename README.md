# **Tech Challenge 2 – Full-Stack Deployment with Jenkins, Docker & AWS**

### **Starter Code Repository**

You'll be working from this repo, which already includes the React frontend and Express backend you'll deploy:

👉 https://github.com/sholaolujobi/techpathway-tech-challenge-2

Clone the repo before you start.

You can modify the code if needed for your pipeline or infrastructure.

---

## **Challenge Duration**

You have 96 **hours** from the moment you receive this to complete everything.

---

## **What You're Being Tested On**

This challenge checks your understanding of:

- Cloud infrastructure
- Infrastructure as Code
- Automated deployments
- CI/CD concepts
- Documentation and clarity

You'll take an existing app and turn it into a fully automated deployment pipeline on AWS.

---

## **What You Need to Build**

### **1. Jenkins Setup**

- Launch a Jenkins server on AWS.
- Make sure it's publicly reachable.
- You can create everything manually (EC2, IAM, permissions, etc.).
- In your README, include a short description of the AWS resources that support your Jenkins instance.

---

### **2. Frontend & Backend Deployment**

Using the code from the repo:

- Containerize both the frontend and backend
- Deploy both apps on **AWS ECS**
- The **frontend must be publicly reachable** in a browser
- The frontend must successfully call the backend endpoint once deployed

---

### **3. CI/CD Pipeline**

Create a Jenkins pipeline that:

- Pulls your GitHub repo
- Builds both Docker images
- Logs in to ECR
- Pushes the images
- Triggers an update on your ECS services so the new versions deploy automatically

Pipeline should run end-to-end with no manual steps once triggered.

---

### **4. Terraform Infrastructure**

Use Terraform to create everything required for your deployment:

- VPC + subnets
- Internet access (IGW, route tables)
- Security groups
- ECS cluster
- Task definitions (frontend + backend)
- ECS services
- (Optional) ECR repositories

Terraform **does not need** to build your Jenkins server unless you want to.

---

## **How to Run the App Locally (for Testing)**

**Backend**

```
cd backend
npm ci
npm start
```

Runs on: `localhost:8080`

**Frontend**

```
cd frontend
npm ci
npm start
```

Runs on: `localhost:3000`

If everything works, the frontend will show **SUCCESS** and a GUID.

---

## **Important Config Files**

- **frontend/src/config.js** → set backend URL
- **backend/config.js** → CORS settings

---

# **How to Submit**

When you finish, put everything into **one PDF** and upload it in the Slack submission channel.

Your PDF must include:

1. **A screenshot of the deployed frontend**

    (The live app running in the browser.)

2. **A screenshot of your Jenkins pipeline after a successful run**
3. **Your GitHub repo link**

    This repo must include your Terraform files, Dockerfiles, Jenkinsfile, and any changes you made.

4. **The public URL of your frontend**
5. **The Jenkins server URL + login details**
6. **Short, simple instructions**

    A few lines on how to test or deploy your setup.

Once everything is inside the PDF, upload that PDF directly into the Slack channel.

That's your final submission.

---

## **How You'll Be Graded**

We'll review your work based on:

- Does the app run successfully on AWS?
- Does your Jenkins pipeline deploy both apps correctly?
- Is your Terraform code clean and accurate?
- How organized and clear is your repo + documentation?
