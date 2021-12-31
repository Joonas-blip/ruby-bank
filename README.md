<h1>Ruby Bank App</h1>

<h3> Simple Rails Banking App </h3>

<h5>Users can...</h5>
<ul>
  <li>User can signup as a customer or login as a existing customer</li>
  <li>User can create (a) bank account(s)</li>
  <li>Users can transfer funds to each other</li>
  <li>Users can view transactions of a specific account</li>
</ul>

<h5>Admin can...</h5>
<ul>
  <li>Admin can view all active accounts</li>
  <li>Admin can view all past accounts</li>
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

<p> to start run</p>

```ruby
bundle install
rails db:create db:migrate db:seed
```

<p> run rails server</p>

```ruby
rails serve
```




Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
