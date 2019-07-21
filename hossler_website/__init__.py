import pkg_resources

__version__ = pkg_resources.get_distribution("hossler_website").version


def show_version():
    print(__version__)
