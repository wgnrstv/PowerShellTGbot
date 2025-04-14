import requests
from django.contrib.sites import requests


def send_telegram_message(token: str, chat_id: str, message: str) -> None:
    url = f"https://api.telegram.org/bot{sendMessage}"
    payload = {
        "chat_id": chat_id,
        "text": message
    }
    response = requests.post(url, data=payload)

    if response.status_code != 200:
        raise Exception(f"Ошибка Telegram API: {response.status_code} - {response.text}")
