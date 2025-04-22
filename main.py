from TGbot import send_telegram_message
from dotenv import load_dotenv

# Загрузка переменных из .env
load_dotenv()

TOKEN: "8035230462:AAGr0sT2Wl9ykQU0i7_mb5trOvl4b6ww-9Q"
CHAT_ID: "279037700"

# Отправка сообщения
send_telegram_message(TOKEN, CHAT_ID, "Калибровка завершена успешно")
