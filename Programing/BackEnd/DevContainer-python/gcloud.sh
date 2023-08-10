gcloud builds submit --tag [IMAGE] /home/houndlybot/chatbot && gcloud run deploy chatbot --image [IMAGE]

git pull && gcloud run deploy chatbot  --platform managed --region northamerica-northeast1