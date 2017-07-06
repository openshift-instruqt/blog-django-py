from django.conf import settings

BLOG_SITE_NAME = settings.BLOG_SITE_NAME
BLOG_BANNER_COLOR = settings.BLOG_BANNER_COLOR
KUBE_POD_NAME = settings.KUBE_POD_NAME

def site_information(request):
    return {
        'BLOG_SITE_NAME': BLOG_SITE_NAME,
        'BLOG_BANNER_COLOR': BLOG_BANNER_COLOR,
        'KUBE_POD_NAME': KUBE_POD_NAME,
    }
