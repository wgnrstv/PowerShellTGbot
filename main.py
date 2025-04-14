from TGbot import send_telegram_message
from dotenv import load_dotenv

# Загрузка переменных из .env
load_dotenv()

TOKEN: "7571011290:AAF0lrN90__wyghc4A16TCv19lz3v3fiEoI"
CHAT_ID: "279037700"

# Отправка сообщения
send_telegram_message(TOKEN, CHAT_ID, "Калибровка завершена успешно")
