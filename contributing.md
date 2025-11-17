---
layout: default
title: "/contributing"
callouts:
  warning:
    title: Warning
    color: red
---

# Contributing

> [!NOTE]
> These instructions are for general student contributions. IEEE members should branch and commit directly to this repository with their _personal_ GitHub account.

## Fork the Repository

- **Fork the Repository:** Navigate to the [wiki repository on GitHub](https://github.com/IEEEAtCornell/wiki) and fork it to your personal GitHub account.
- **Clone the Fork:** Clone your forked repository to your local machine

## Adding a Class

- Create a new [markdown](https://www.markdownguide.org/basic-syntax/) document in `_courses/` with a title with the format `eceXXXX.md`, where `XXXX` is the lowest valid course code (i.e. if there are 4xxx and 5xxx versions, you should list the 4xxx code).
- Fill out the header information as shown in the [ECE 2300 page](./course/ece2300.md).

> [!IMPORTANT]
> Make sure to fill out the `categories` field, this is how the classes are sorted and displayed on the [homepage](./index.md).

- Save, commit, and push to the `page` branch

## Editing a Class

- Edit one of the class files under [`_courses`](./_courses/). Update the date in the file name to the date of the edit
- Our pages support [MathJax](https://www.mathjax.org/) (a subset of [LaTeX](https://www.latex-project.org/)) outside the front matter section of class pages. See the [ECE 3250 page](./_courses/ece3250.md) for an example.

## Test your Changes

1. **[Install Docker](https://docs.docker.com/engine/install/). Follow the installation guide per your operating system.**

2. **Build the Docker image**

    ```shell
    docker compose build
    ```

    or run

    ```shell
    make build
    ```

    ([Make](https://www.gnu.org/software/make/manual/make.html) required).

3. **Run the site**

    ```shell
    docker compose up
    ```

    or run

    ```shell
    make serve
    ```

    Look for the `Server address:` field near the end of the command's output. You can view the site by pasting that URL into a web browser of your choice. It is generally `http://localhost:4000/wiki/`.

    > [!TIP]
    > The local site will update automatically as you edit the code--just make sure to reload the page!

## Submit a Pull Request

- **Open a Pull Request:** After pushing your changes to your fork, go to the original wiki repository
- Click the "Compare & pull request" button, which will appear when GitHub detects changes between your fork and the original repository
- **Submit the PR:** Provide a clear description of the changes you made, explaining the purpose of your contributions, and then submit the pull request

## Review Process

- A project maintainer will review your pull request. If it meets the contribution guidelines, it will be merged into the main repository
- Once merged, your changes will automatically be deployed by GitHub Pages, and you can view them live on the [wiki site](https://ieeeatcornell.github.io/wiki/)!
