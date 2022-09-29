![](https://img.shields.io/badge/Microverse-blueviolet)

# Rent-A-Green

> This application allow users to book an appointment to test an electric car. The homepage is a showcase of the cars. You can also add new cars, view the details of a car, and book an appointment for renting a car, among other features.

This back-end API is complemented by the [front-end](https://github.com/alexpuente0/final-capstone-frontend)

![image](https://user-images.githubusercontent.com/100373071/192989439-7b28aeab-661a-403d-b4bb-02d14fef39ef.png)

## Built With

- Ruby on Rails
- PostgreSQL
- devise / devise-jwt - for authentication
- cancancan - for authorization

## Live Demo

[Live API documentation](https://rent-a-green.herokuapp.com)

### Kanban Board
[Kanban board link](https://github.com/users/alexpuente0/projects/4).

#### Initial Kanban board screenshot:
![image](https://user-images.githubusercontent.com/99830261/190246424-1644dd8b-a0c9-45d5-b794-06fa6666a8e4.png)

#### Final number of team members:

We are 3 people on the team:
@rbanos-mv
@acolombo1
@alexpuente0

### Getting Started

To get a local copy up and running follow these simple steps:

### Prerequisites

- Ruby ruby-3.1.2 installed
- PostgreSQL dbms running

### Setup

- Open your terminal and navigate to the folder you would like to save the project.

- Type these commands into the terminal:

```
git clone https://github.com/acolombo1/final-capstone-back-end.git
cd final-capstone-back-end
bundle install
```

- You will need a `.env` file before you install and run the project. The `.env` file contains environment variables needed to deploy the webpage. There is a commented `.env.example` file you can use as a guide to configure your own. Type the following commands into the terminal (or Git Bash, if using Windows) to create your `.env` file:

```
cp .env.example .env

rails secret
```

- Edit file .env

  - Provide the values for the variables
    - DATABASE_HOST
    - DATABASE_USER
    - DATABASE_PASSWORD
    - DEVISE_JWT_SECRET_KEY
  - Assign the value returned by the `rails secret` to DEVISE_JWT_SECRET_KEY.

- Type this commands into the terminal:

```
rails db:reset
```

### Run application

- Type this command into the terminal:

```
rails server
```

- Open your web browser at [http://127.0.0.1:3001/](http://127.0.0.1:3001/)

### Testing

- Type this command into the terminal:

```
rspec
```

## Authors

👤 **Roberto A. Baños Alvarez**

- GitHub: [@rbanos-mv](https://github.com/rbanos-mv)
- Twitter: [@RobertoBanosMV](https://twitter.com/RobertoBanosMV)
- LinkedIn: [Roberto A Baños Alvarez](https://linkedin.com/in/roberto-a-baños-alvarez-500766234)

👤 **Alejandro Puente**

- GitHub: [@alexpuente0](https://github.com/alexpuente0)
- Twitter: [@zero_rock](https://twitter.com/zero_rock)
- LinkedIn: [Alejandro Puente](https://www.linkedin.com/in/alex-puente-farias/)

👤 **Aldo Colombo**

- GitHub: [@acolombo1](https://github.com/acolombo1)
- Twitter: [@aldocolombo](https://twitter.com/aldocolombo)
- LinkedIn: [Aldo Colombo](https://www.linkedin.com/in/aldo-colombo-2156009)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Microverse](https://www.microverse.org/) for the motivation.

## 📝 License

This project is [MIT](./MIT.md) licensed.
