import os

BLOG_SITE_NAME = os.environ.get('BLOG_SITE_NAME', 'OpenShift Blog')
BLOG_BANNER_COLOR = os.environ.get('BLOG_BANNER_COLOR', '')
KUBE_POD_NAME = os.environ.get('HOSTNAME', 'localhost')

def site_information(request):
    return {
        'BLOG_SITE_NAME': BLOG_SITE_NAME,
        'BLOG_BANNER_COLOR': BLOG_BANNER_COLOR,
        'KUBE_POD_NAME': KUBE_POD_NAME,
    }
