# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: 'Roberto', email: 'roberto@mail.com', password: 'valido', password_confirmation: 'valido')

Item.create(name: 'BMW i4', range: 'up to 367 miles', photo: 'https://capstone-rent-a-green.s3.amazonaws.com/bmw-i41.jpg',
            description: 'BMW’s new i4 electric car will go on sale in November, priced from £51,905. The four-door coupe will occupy the same space as the 4 Series Gran Coupe and is set to rival the Tesla Model 3.<br><br>
There will be three versions at launch: i4 eDrive40 in Sport and M Sport Trim and the i4 M50, the company’s first purely electric performance car from BMW M.<br><br>
The eDrive40 uses a 340PS electric motor to power the rear wheels, while the i4 M50 will come with electric motors at both the front and rear axle with a combined maximum output of 544PS. Both use an 84kWh battery, providing a range of up to 367 miles.')

Item.create(name: 'Genesis GV60', range: 'up to 280 miles', photo: 'https://capstone-rent-a-green.s3.amazonaws.com/genesis-gv60.jpg',
            description: 'Based on the same platform as the Hyundai Ioniq 5 and Kia EV6, the Genesis GV60 promises a more luxurious take on the compact electric crossover.<br><br>
Three models will be offered: one rear-wheel-drive and two all-wheel-drive. Each will feature a 77.4kWh battery, providing a range of up to 280 miles.<br><br>
Charging speeds of up to 350kW can be achieved, boosting the battery level from 10% to 80% in 18 minutes.<br><br>
The car is equipped with digital side mirrors and auto-flush outside door handles, giving a smoother appearance. It will also feature active noise cancelling and suspension that uses a camera to adapt to the road ahead.')

Item.create(name: 'Kia EV6', range: 'up to 328 miles', photo: 'https://capstone-rent-a-green.s3.amazonaws.com/kia-ev6.jpg',
            description: 'Kia’s crossover-style EV6 electric car will spearhead a new range of electric models from the brand, each wearing the ‘EV’ moniker. Six are expected to launch by 2027.<br><br>
It costs from £40,895 and there are three trim grade and two powertrain options, plus a high-performance GT version.<br><br>
All models are equipped with a 77.4kWh battery pack, which provides a range of up to 328 miles.<br><br>
One highlight is the vehicle-to-load (V2L) function, which is capable of supplying up to 3.6kW of power to an external device. It could be used to charge another EV, if needed.')

Item.create(name: 'Mercedes EQB', range: '260 miles', photo: 'https://capstone-rent-a-green.s3.amazonaws.com/mercedes-eqb.jpg',
            description: 'Slotting in between the EQA and EQC, the EQB is based on the existing Mercedes GLB and shares its boxy styling and seven-seat layout.<br><br>
The new model will rival electric SUVs such as the recently launched Audi Q4 e-tron and VW ID4.<br><br>
Two all-wheel-drive models will be offered in the UK next year, both using a 66kWh battery, with 222PS or 292PS. Charging can be carried out at up to 100kW, allowing a 10%-80% charge time in 30 minutes.<br><br>
Mercedes says a long-range version of the EQB, with a larger battery, will also be available.')

Item.create(name: 'Mercedes EQE', range: 'up to 410 miles', photo: 'https://capstone-rent-a-green.s3.amazonaws.com/mercedes-eqe.jpg',
            description: 'The electric E-Class counterpart is based on Mercedes’ purpose-built electric vehicle (EV) platform and promises a range of up to 410 miles.<br><br>
Borrowing much of its exterior and interior design from the larger EQS, the new EQE promises a similar focus on in-car technology.<br><br>
Multiple powertrain options are expected to be offered, but only the EQE 350 has been detailed so far. It uses a 90kWh battery and has a power output of 292PS.<br><br>
The EQE is compatible with up to 170kW chargers, enabling an 80% charge in around half an hour.<br><br>
It’s billed for arrival in summer 2022, with prices likely to start at around £60,000.')

Reservation.create(city: 'Monterrey', date: '2022-09-16', user: User.first, item: Item.first)
Reservation.create(city: 'Buenos Aires', date: '2022-09-17', user: User.last, item: Item.last)
