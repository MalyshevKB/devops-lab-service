from fastapi import FastAPI
from .routes import router
from .metrics import setup_metrics

app = FastAPI()

setup_metrics(app)
#1
app.include_router(router)
