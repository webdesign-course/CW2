<?php

include "pdo.php";

$selected_site_type = $_POST["site_type"];


echo "<html><body>";
echo "<form action='user.php' method='post'>";
echo "<select name='site_type'>";

$result = $pdo->query("SELECT name FROM user ORDER BY name");

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
  echo "<tr><th align='left'>User Name</th>
  <th align='left'>Visited Site</th>
  <th align='left'>Rating</th>
  </tr>";

  $stmt = $pdo->prepare("SELECT visit.userName, visit.siteName, visit.rating
    FROM visit 
    WHERE visit.userName = ?");
  $stmt->execute([$selected_site_type]);


  //creating the table
  while ($row = $stmt->fetch()) {
    echo "<tr><td>" . $row["userName"] . "</td>
    <td>" . $row["siteName"] . "</td>
    <td>" . $row["rating"] . "</td>
    </tr>";
  }
}

echo "</table>";
echo "</body></html>";

?>