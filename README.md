# BackEnd-for-the-project
The G-Blog

The G-Blog is a Ruby application for publishing blog articles. It provides a simple and intuitive interface for creating, editing, and managing blog posts, as well as allowing readers to leave comments.
Installation

To install The G-Blog, you will need to have Ruby 2.7.4 and the following dependencies installed on your computer:

    Sinatra
    ActiveRecord
    sqlite3

Once you have these dependencies installed, you can follow these steps to get started:

    Clone this repository to your local machine:

shell

$ git clone https://github.com/your-username/the-g-blog.git

    Navigate to the project directory:

shell

$ cd the-g-blog

    Install the required gems:

ruby

$ bundle install

    Set up the database:

shell

$ bundle exec rake db:create
$ bundle exec rake db:migrate

    Start the application:

ruby

$ ruby app.rb

    Open your web browser and navigate to http://localhost:4567 to view the application.

Usage

To create a new blog post, click on the "New Post" button on the home page. This will take you to a form where you can enter the title and content of your post. Once you have entered your post, click the "Create Post" button to publish it.

To view an existing post, click on the title of the post on the home page. This will take you to the post page, where you can view the content and comments for the post.

To leave a comment on a post, enter your name and comment in the form at the bottom of the post page, then click the "Submit" button.
License

The G-Blog is open source software licensed under the MIT License. See the LICENSE file for more information.