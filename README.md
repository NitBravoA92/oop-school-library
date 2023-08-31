<a name="readme-top"></a>

<div align="center">
  <h1><b>OOP School Library | Ruby Project</b></h1>
</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [OOP School Library ](#oop-school-library-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
    - [Run tests](#run-tests)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)

---

<!-- PROJECT DESCRIPTION -->

# OOP School Library <a name="about-project"></a>

**"OOP School Library"** is a program made in ruby ​​for a University library, which was created using the object-oriented programming paradigm. The program allows users to register new students and teachers, manage book information, and more efficiently control books borrowing.

---

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Ruby</summary>
  <ul>
    <li><a href="https://www.ruby-lang.org/en/">Ruby Official Website</a></li>
  </ul>
</details>

---

<!-- Features -->

### Key Features <a name="key-features"></a>

<ul>
  <li>Ruby</li>
  <li>Linters
    <ul>
      <li>Rubocop</li>
    </ul>
  </li>
  <li>Follow Microverse's list of best practices</li>
</ul>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

<ul>
    <li><p>A code editor (we recommend Visual Studio Code)</p></li>
</ul>

<ul>
    <li><p>Git and a GitHub account</p></li>
</ul>

### Setup

Clone this repository to your desired folder by using this 👇️ command :

```
git clone https://github.com/NitBravoA92/oop-school-library.git
```

### Install

Go to the project directory:

```
 cd oop-school-library
```

Before to run the program, verify that you have Ruby installed on your OS running the following command:

```
 ruby -v
```

It should show you the version of ruby ​​installed. If this does not happen and only an error message is displayed, then you should either verify your installation or install Ruby from scratch.

[Download and Install Ruby](https://www.ruby-lang.org/en/downloads/)

### Usage

Run the following command inside the project folder:

```
 ruby run.rb
```

This will display the following output:

```
true
"Henry, age: 40, specialization: Data Science"
true
"James, age: 19, classroom: Biology"
"¯(ツ)/¯"
true
"maximilianus"
"Maximilianus"
"Maximilian"
"Jack"
"Jack rents the Book: The Gene: An Intimate History on 2023-08-30"
```

This is just a test code. You can open the `run.rb` file using the code editor of your choice and change the input parameters in the creation of objects with Classroom, Person, Student, Teacher, Book and Rental classes:

```
classroom1 = Classroom.new('Biology')
person1 = Person.new(15, 'Rick', parent_permission: true)
student1 = Student.new(classroom1, 19, 'James', parent_permission: false)
teacher1 = Teacher.new('Data Science', 40, 'Henry')
book1 = Book.new('The Gene: An Intimate History', 'Siddhartha Mukherjee')
person3 = Person.new(29, 'Jack')
rent_book1 = Rental.new(book1, person3, '2023-08-30')
```

### Run tests

- Not aplicable.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Nitcelis Bravo**

- GitHub: [Nitcelis Bravo](https://github.com/NitBravoA92)
- Twitter: [@softwareDevOne](https://twitter.com/softwareDevOne)
- LinkedIn: [Nitcelis Bravo Alcala](https://www.linkedin.com/in/nitcelis-bravo-alcala-b65340158)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

Upcoming improvements:

- [x] Implement the "Decorator" design pattern to extends the functionalities of the classes
- [x] Implement the association relationships
- [ ] Add basic UI to the program
- [ ] Preserve data
- [ ] Create unit tests

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/NitBravoA92/decode-morse-code-message/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project and know someone who might find it helpful, please share it.
Or give it a **star** ⭐️ if you like this project!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I thank Microverse for this fantastic opportunity, and the code reviewers for their advice and time.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---
