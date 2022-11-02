# Paws & Tails

*Bring Your New Best Friend Home.*

We are building a SAAS app that aims to connect pet finders and breeders together and improve the whole pet-finding business.

<!-- TOC -->
* [Team Members](#team-members)
* [For the TA Team](#for-the-ta-team)
  * [How to Run and Test the Project Locally](#how-to-run-and-test-the-project-locally)
  * [Deployed Project](#deployed-project)
<!-- TOC -->

## Team Members 

	Tianqi Zhao (tz2529)
	Jiacheng Yin (jy3280)
	Dmitrii Zakharov (dz2428)

## For the TA Team

### How to Run and Test the Project Locally

After you have cloned the project, run the following scripts step-by-step to have it running locally.

*Install all the packages*

```bash
bundle install --without production
```

*Set up the database*

```bash
rake db:migrate
rake db:seed
```

*Running the App*

```bash
rails s
```

*Or if you are on codio,*

```bash
rails server -b 0.0.0.0
```

*Running the Tests*

```bash
bundle exec rake spec
bundle exec rake cucumber
```

Now, checkout `coverage/index.html`!

### Deployed Project

Our project is running at: [https://paws-and-tails.herokuapp.com/](https://paws-and-tails.herokuapp.com/)
