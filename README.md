<h1>Ruby Bank App</h1>

<h3> Simple Rails Banking App </h3>

<h5>Users can...</h5>
<ul>
  <li>User can signup as a customer or login as a existing customer</li>
  <li>User can create (a) bank account(s)</li>
  <li>Users can view transactions of a specific account</li>
  <li>Users can transfer funds to each other or between "personal" accounts</li>
</ul>

<h5>Admin can...</h5>
<p>Admin actions can be found at pah "/admin"</p>
<ul>
  <li>Admin can view all active accounts</li>
  <li>Admin can view all past transactions</li>
  <li>Admin can deposit funds to accounts from Ruby Bank's account</li>
</ul>


<h3> Instructions </h3>
<h5>Users in seed:</h5>
<table>
  <tr> 
    <th>Email</th>
    <th>Password</th>
    <th>Admin</th>
  </tr>
  <tr>
    <td>user1@mail.com</td>
    <td>123456</td>
    <td>false</td>
  </tr>
  <tr>
    <td>user2@mail.com</td>
    <td>123456</td>
    <td>false</td>
  </tr>
  <tr>
    <td>admin@mail.com</td>
    <td>123456</td>
    <td>true</td>
  </tr>
</table>

<p> For testing the above users can be used. The bank account numbers of the respective users can be found using the console after seeding the database.</p>

<h3>Database design</h3>
<img src="https://user-images.githubusercontent.com/64923657/147818963-e044b66d-fae6-496a-8287-41d6f0b1ee2b.png">

<p> to start run</p>

```ruby
bundle install
rails db:create db:migrate db:seed
```

<p> run rails server</p>

```ruby
rails serve
```

<h3> Still in the oven... </h3>
<ul>
  <li>Refactoring commonly used code blocks into service classes</li>
  <li>Control the way accounts can be created by users</li>
  <li>Increase powers of the Admin eg. Management of users, management of accounts, blocking of accounts</li>
  <li>Increase powers of the Admin eg. Management of users, management of accounts, blocking of accounts</li>
</ul>

Rails built using the le wagon rails template: [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
