Setting up Laravel-capable PHP environment on Mac.

1. Update PHP using homebrew - https://github.com/josegonzalez/homebrew-php
2. Install mcrypt - brew install php55-mcrypt
3. Install MySQL - brew install mysql
	3a. Check MySQL install - mysql -u root
	3b. If a doesn't work, stop mysql then kill all mysql processes. Restart mysql
4. Install server of choice - homebrew install nginx