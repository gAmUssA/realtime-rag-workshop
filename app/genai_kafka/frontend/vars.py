import os 

FRONTEND_RAW_PROMPT_TOPIC = os.environ.get("CC_KAFKA_RAW_PROMPT_TOPIC")
FRONTEND_PROMPT_ANSWER_TOPIC = os.environ.get("CC_KAFKA_PROMPT_RESPONSE_TOPIC")
CC_BOOTSTRAP = os.environ.get("CC_CLUSTER_KAFKA_URL")
CC_API_KEY = os.environ.get("CC_CLUSTER_API_KEY")
CC_API_SECRET = os.environ.get("CC_CLUSTER_API_SECRET")
CC_SR_URL = os.environ.get("CC_CLUSTER_SR_URL")
CC_SR_USER = os.environ.get("CC_CLUSTER_SR_USER")
CC_SR_PASSWORD = os.environ.get("CC_CLUSTER_SR_PASS")