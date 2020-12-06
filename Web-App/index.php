<?php
    require "header.php";
?>
    <div class="starter-template">
        <?php
            if(!isset($_SESSION['id'])){
                echo'<p>You are logged out!</p>';
            }
            else if(isset($_SESSION['id'])){
                echo'<p>You are logged in!</p>';
            }
        ?>
    </div>
<?php
    require "footer.php";
?>