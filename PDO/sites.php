<?php

include "pdo.php";

//if "site_type" is posted(put in to the global array "POST")
//Put it into the the following variable
//When you first open up the website you will see an error
//this is due to the fact that "site_type" hasn't been posted yet
//the "site_type" posts the siteType selected by the picker
//the "site type" is posted when you click on submit
$selected_site_type = $_POST["site_type"];

//echo is like print
//here you are echoing html language to make a picker
echo "<html><body>";
echo "<form action='sites.php' method='post'>";
echo "<select name='site_type'>";
//the following runs a query to select all the type
//the result of the query has been put in the $result variable
$result = $pdo->query("SELECT DISTINCT type FROM siteType ORDER BY id");

//"fetch" function every value on a column from the query
//fetch function works in the while loop until all the data has been fetched
while ($row = $result->fetch()) {
  //just like how array work (for example : array[3])
  //you can select the value of the column by using the name of the row
  //in this case we use want the value in column which in under the row "type"
  $type = $row["type"];

  if ($type == $selected_site_type) {
    $option = "<option selected>";
  } else {
    $option = "<option>";
  }
  //unlike java, concantation in php works with dots
  echo $option . $type . "</option>";
}

echo "</select>";
echo "<input type='submit' value='Submit'>";
echo "</form>";

//changed
if ($selected_site_type) {
  echo "<table border = 1>";
  echo "<tr><th align='left'>Site Name</th>
  <th align='left'>City</th>
  <th align='left'>Country</th>
  <th align='left'>Visa for the citizens of Wakanda</th>
  </tr>";

  //prepare function is used so that the query can run at runtime or dynamically
  //this query does answers the first question of the task 3
  //"?" mark is used so that we can input a variable into the query
  //we input the variable by using execute statement 
  //and puting variable beside the execute statement 
  //for example, look at line 64
  $stmt = $pdo->prepare("SELECT sites.name, sites.city, cities.country, countries.visaForWakanda
    FROM sites 
    JOIN siteType ON  sites.type = siteType.id
    JOIN cities ON sites.city = cities.name
    JOIN countries ON cities.country = countries.name
    WHERE siteType.type = ?");
  $stmt->execute([$selected_site_type]);


  //creating the table
  while ($row = $stmt->fetch()) {
    echo "<tr><td>" . $row["name"] . "</td>
    <td>" . $row["city"] . "</td>
    <td>" . $row["country"] . "</td>
    <td>" . $row["visaForWakanda"] . "</td>
    </tr>";
  }
}

echo "</table>";
echo "</body></html>";

?>