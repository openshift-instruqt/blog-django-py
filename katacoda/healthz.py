from django.http import HttpResponse

def ready(request):
    return HttpResponse("OK", content_type="text/plain")

def alive(request):
    return HttpResponse("OK", content_type="text/plain")
