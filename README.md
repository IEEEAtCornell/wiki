# [IEEE at Cornell Wiki](https://ieeeatcornell.github.io/wiki/)

This wiki covers class information for IEEE-related courses and activities at Cornell University. Our goal is to provide easy access to important resources, course materials, and student guidance. For more info, see more [about us](https://ieeeatcornell.github.io/wiki/about/).

## Contributing

> [!NOTE]
> These instructions are for general student contributions. IEEE members should branch and commit directly to this repository.

### Fork the Repository

- **Fork the Repository:** Navigate to the [wiki repository on GitHub](https://github.com/IEEEAtCornell/wiki) and fork it to your personal GitHub account.
- **Clone the Fork:** Clone your forked repository to your local machine

### Adding a Class

- Create a new [markdown](https://www.markdownguide.org/basic-syntax/) document in `_posts/` with a title with the format `YYYY-MM-DD-eceXXXX.md`.
  - `YYYY-MM-DD` is the date of creation
  - `XXXX` is the course code
- Fill out the header information as shown in the [ECE 2300 page](./_posts/2024-09-15-ece2300.md).

> [!IMPORTANT]
> Make sure to fill out the `categories` field, this is how the classes are sorted and displayed on the [homepage](./index.md).

- Save, commit, and push to the `page` branch

### Editing a Class

1. Edit one of the class files under [`_posts`](./_posts/). Update the date in the file name to the date of the edit

### Test your Changes

TODO: build locally!

### Submit a Pull Request

- **Open a Pull Request:** After pushing your changes to your fork, go to the original wiki repository
- Click the "Compare & pull request" button, which will appear when GitHub detects changes between your fork and the original repository
- **Submit the PR:** Provide a clear description of the changes you made, explaining the purpose of your contributions, and then submit the pull request

### Review Process

- A project maintainer will review your pull request. If it meets the contribution guidelines, it will be merged into the main repository
- Once merged, your changes will automatically be deployed by GitHub Pages, and you can view them live on the [wiki site](https://ieeeatcornell.github.io/wiki/)!
