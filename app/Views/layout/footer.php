<?php

use App\Models\Konfigurasi_model;

$konfigurasi  = new Konfigurasi_model;
$site         = $konfigurasi->listing();
// Menu
use App\Models\Menu_model;

$menu         = new Menu_model();
$site         = $konfigurasi->listing();
$menu_berita  = $menu->berita();
$menu_profil  = $menu->profil();
$menu_layanan  = $menu->layanan();
?>
<!-- ======= Footer ======= -->
<footer id="footer">
  <div class="footer-top">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 col-md-6">
          <div class="footer-info">
            <h3><?php echo $site['namaweb'] ?></h3>
            <p>
              <?php echo nl2br(strip_tags($site['alamat'])) ?><br>
              <strong>Phone:</strong> <?php echo $site['telepon'] ?><br>
              <strong>Email:</strong> <?php echo $site['email'] ?><br>
			</p>
			<div id="sfc19z2z4h6shsr9g3ahae19gh25n1u553m"></div><script type="text/javascript" src="https://counter4.optistats.ovh/private/counter.js?c=19z2z4h6shsr9g3ahae19gh25n1u553m&down=async" async></script><noscript><a href="https://www.freecounterstat.com" title="website counter"><img src="https://counter4.optistats.ovh/private/freecounterstat.php?c=19z2z4h6shsr9g3ahae19gh25n1u553m" border="0" title="website counter" alt="website counter"></a></noscript>
            <div class="social-links mt-3">
              <a href="<?php echo $site['twitter'] ?>" class="twitter"><i class="fab fa-twitter"></i></a>
              <a href="<?php echo $site['facebook'] ?>" class="facebook"><i class="fab fa-facebook"></i></a>
              <a href="<?php echo $site['instagram'] ?>" class="instagram"><i class="fab fa-instagram"></i></a>
              <a href="<?php echo $site['youtube'] ?>" class="google-plus"><i class="fab fa-youtube"></i></a>
              <a onclick="WA()" class="google-plus"><i class="fab fa-whatsapp"></i></a>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 footer-links">
          <h4>Facebook</h4>
         <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fdinaskominfoluwu%2F&tabs=timeline&width=340&height=300&small_header=true&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" width="340" height="300" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe> 
        </div> 
        <div class="col-lg-4 col-md-6 footer-links">
          <h4>Layanan Kami</h4>
          <ul>
            <?php foreach ($menu_layanan as $menu_layanan) { ?>
              <li><i class="bx bx-chevron-right"></i> <a href="<?php echo base_url('berita/layanan/' . $menu_layanan['slug_berita']) ?>"><?php echo $menu_layanan['judul_berita'] ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <!--<div class="col-lg-4 col-md-6 footer-newsletter">
          <h4>Find Us on Map</h4>
          <style type="text/css" media="screen">
            iframe {
              width: 100%;
              height: 200px;
            }
          </style>
          <?php echo $site['google_map'] ?>
        </div>-->
      </div>
    </div>
  </div>
  <div class="container">
    <div class="copyright">
      &copy; Copyright <strong><span>Bidang E-Government DKISP</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/medicio-free-bootstrap-theme/ -->
      Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
  </div>
</footer><!-- End Footer -->=
<div id="preloader"></div>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
<!-- Vendor JS Files -->
<script src="<?php echo base_url() ?>/assets/template/assets/vendor/aos/aos.js"></script>
<script src="<?php echo base_url() ?>/assets/template/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="<?php echo base_url() ?>/assets/template/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="<?php echo base_url() ?>/assets/template/assets/vendor/php-email-form/validate.js"></script>
<script src="<?php echo base_url() ?>/assets/template/assets/vendor/purecounter/purecounter.js"></script>
<script src="<?php echo base_url() ?>/assets/template/assets/vendor/swiper/swiper-bundle.min.js"></script>
<!-- Template Main JS File -->
<script src="<?php echo base_url() ?>/assets/template/assets/js/main.js"></script>
<!-- DataTables  & Plugins -->
<script src="<?php echo base_url() ?>/assets/admin/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<?php echo base_url() ?>/assets/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="<?php echo base_url() ?>/assets/admin/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>

<script>
  $(function() {
    $('#example1').DataTable();
  });

  function WA() {
    location.href = "https://wa.me/6281342234700";
  }
</script>

</body>

</html>