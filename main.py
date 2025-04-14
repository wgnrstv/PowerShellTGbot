from TGbot import send_telegram_message
from dotenv import load_dotenv

# Загрузка переменных из .env
load_dotenv()

TOKEN: "5645275250:AAFQW01-KIPBB2qdJ0VO111xf3wAXshOSOE"
CHAT_ID: "1176323549"

# Отправка сообщения
send_telegram_message(TOKEN, CHAT_ID, "Калибровка завершена успешно")
