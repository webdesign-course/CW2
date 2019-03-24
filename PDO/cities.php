<?php

include "pdo.php";

$selected_site_type = $_POST["site_type"];


echo "<html><body>";
echo "<form action='cities.php' method='post'>";
echo "<select name='site_type'>";

$result = $pdo->query("SELECT name FROM cities ORDER BY name");

while ($row = $result->fetch()) {

  $type = $row["name"];

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
  echo "<tr>
  <th align='left'>City</th>
  <th align='left'>Site</th>
  <th align='left'>Average Rating</th>
  </tr>";

  $stmt = $pdo->prepare("SELECT sites.city, sites.name, 
    AVG(visit.rating) as AverageRating
    FROM sites
    JOIN visit ON sites.name = visit.siteName
    WHERE sites.city = ?
    GROUP BY sites.name");
  $stmt->execute([$selected_site_type]);


  //creating the table
  while ($row = $stmt->fetch()) {
    echo "<tr>
    <td>" . $row["city"] . "</td>
    <td>" . $row["name"] . "</td>
    <td>" . $row["AverageRating"] . "</td>
    </tr>";
  }
}

echo "</table>";
echo "</body></html>";

?>