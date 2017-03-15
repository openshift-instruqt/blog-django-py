import os

BLOG_SITE_NAME = os.environ.get('BLOG_SITE_NAME', 'OpenShift Blog')

def site_information(request):
    return { 'BLOG_SITE_NAME': BLOG_SITE_NAME }
