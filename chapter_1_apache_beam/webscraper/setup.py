import setuptools

setuptools.setup(
    name="scraping_pipeline",
    version="0.0.1",
    install_requires=["structlog",
                      "wordcloud",
                      "beautifulsoup4",
                      "matplotlib"],
    packages=setuptools.find_packages(),
)