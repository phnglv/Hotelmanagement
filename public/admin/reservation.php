<?php
require("../config.php");
include("./includes/header.php");
?>
<section class="content charts-section">
  <table class="table">
    <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col">User</th>
        <th scope="col">Room</th>
        <th scope="col">Booking Date</th>
        <th scope="col">No. adults</th>
        <th scope="col">No. children</th>
        <th scope="col">Booking Time</th>
      </tr>
    </thead>
    <tbody>
      <?php
      $rows = getAllReservations($pdo);

      foreach ($rows as $row) {
        $room = getRoomFromId($pdo ,$row['room_id'] );
        $user = getUserFromId($pdo ,$row['user_id'] );
      ?>

        <tr>
          <th scope="row"><? if ($row['reservation_id']) {
                            echo $row['reservation_id'];
                          } else echo "NULL"; ?></th>
          <th scope="row"><? if ($user['user_fname']) {
                            echo $user['user_fname'];
                          } else echo "NULL"; ?></th>
          <th scope="row"><? if ($room['room_name']) {
                            echo $room['room_name'];
                          } else echo "NULL"; ?></th>
          <th scope="row"><? if ($row['booking_date']) {
                            echo $row['booking_date'];
                          } else echo "NULL"; ?></th>
          <th scope="row"><? if ($row['no_adults']) {
                            echo $row['no_adults'];
                          } else echo "0"; ?></th>
          <th scope="row"><? if ($row['no_children']) {
                            echo $row['no_children'];
                          } else echo "0"; ?></th>
          <th scope="row"><? echo $row['reservation_created'] ?></th>
        </tr>
      <? } ?>
    </tbody>
  </table>
</section>
<?php include("./includes/footer.php"); ?>
<script src="<?= SROOT ?>/vendor/fullcalender/main.js"></script>
<script>

</script>
</body>

</html>