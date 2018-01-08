<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Obaju e-commerce template">
    <meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
    <meta name="keywords" content="">

    <title>
    Đăng ký
    </title>

    <meta name="keywords" content="">

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100' rel='stylesheet' type='text/css'>

    <!-- styles -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/owl.carousel.css" rel="stylesheet">
    <link href="css/owl.theme.css" rel="stylesheet">

    <!-- theme stylesheet -->
    <link href="css/style.default.css" rel="stylesheet" id="theme-stylesheet">

    <!-- your stylesheet with modifications -->
    <link href="css/custom.css" rel="stylesheet">

    <script src="js/respond.min.js"></script>

    <link rel="shortcut icon" href="favicon.png">
<script>
    function kiemtra()
{
	if(form1.txtTenDangNhap.value==""){
		alert(' Chưa nhập tài khoản ')
		return false;
	}
	if(form1.txtTenDangNhap.value.lenght>30){
		alert(' Tên đăng nhập tối đa 30 ký tự ')
		return false;
	}
	if(form1.txtMatKhau.value==""){
		alert(' Chưa nhập mật khẩu ')
		return false;
	}
	if(form1.txtMatKhau.value<5){
		alert(' Mật khẩu ít nhất 5 ký tự ')
		return false;
	}
	return true;
}
</script>
<?php
    include_once('connection.php');
if(isset($_POST['txtTenDangNhap'])){
	$TenDangNhap = $_POST['txtTenDangNhap'];
	$MatKhau = $_POST['txtMatKhau1'];
	$hoten = $_POST['txtHoTen'];
	$email = $_POST['txtEmail'];
	$diachi = $_POST['txtDiaChi'];
	$sodienthoai = $_POST['txtDienThoai'];
	$Birthday = $_POST['txtNam']."/".$_POST['txtThang']."/".$_POST['txtNgay'];
    $day=getdate();
	if(isset($_POST['grpGioiTinh'])){
	$gioitinh = $_POST['grpGioiTinh'];
	}
    //Bắt lỗi ngày tháng
	if($_POST['txtNgay']=="" || $_POST['txtThang']=="" || $_POST['txtNam']==""){
        $Ngay1=$Thang1=$Nam1=0;
        $Checkday = checkdate($Ngay1,$Thang1,$Nam1);
        $day['year'] = 1;
        $_POST['txtNam'] = 1;
    
    }else
        if(is_numeric($_POST['txtNgay'])!=true ||  is_numeric($_POST['txtThang'])!=true || is_numeric($_POST['txtNam']) != true){
        $Ngay1=$Thang1=$Nam1=0;
        $Checkday = checkdate($Ngay1,$Thang1,$Nam1);

    } 
    else{

         $Checkday = checkdate($_POST['txtNgay'],$_POST['txtThang'],$_POST['txtNam']); 
    }

    
    
    //Kết thúc bắt lỗi
	$loi = "";
    
if($_POST['txtTenDangNhap']=="" || $_POST['txtMatKhau1'] =="" || $_POST['txtHoTen']=="" || $_POST['txtEmail']=="" || $_POST['txtDiaChi']=="" || $_POST['txtDienThoai']=="" || !isset($gioitinh)){
		$loi.="<li>Vui lòng nhập đầy đủ thông tin có dấu *!!!</li>";
	}
	if($_POST['txtMatKhau1'] != $_POST['txtMatKhau2']){
		$loi.="<li>Xác nhận mật khẩu chưa trùng khớp</li>";
	}
	if(strlen($_POST['txtMatKhau1'])<=5){
		$loi.="<li>Mật khẩu phải nhiều hơn 5 ký tự</li>";
	}
	
	if(strpos($_POST['txtEmail'],"@") === false){
		$loi.="<li>Địa chị E-mail không hợp lệ</li>";
	}
	
	if($Checkday==false ){
		$loi.="<li>Ngày nhập chưa đúng </li>";
       
	}
    
    if($day['year']-$_POST['txtNam'] <15){
        $loi.="<li>Bạn ít nhất phải 15 tuối để đăng ký tài khoản mới</li>";
    }
	
	if($loi!=""){
       
		echo "<ul class='cssLoi' style='color: red;'>".$loi."</ul>";
	}
    else{
		
		$sql =" SELECT * FROM taikhoan WHERE username_kh='$TenDangNhap' OR email_tk='$email'";
		$ketqua = mysqli_query($conn,$sql);
		if(mysqli_num_rows($ketqua)==0)
		{
		mysqli_query($conn,"INSERT INTO taikhoan(username_kh, pass_kh, ten_tk, gioitinh_tk, diachi_tk, sodienthoai_tk, email_tk, ngaysinh_tk, cmnd_tk, makichhoat_tk, trangthai_tk, loaitk) 
		VALUE ('$TenDangNhap','".md5($MatKhau)."','$hoten',$gioitinh, '$diachi','$sodienthoai','$email','$Birthday','','',0,0)") or die(mysqli_error($conn));
            
//		$noidungmail = "<p>Chúc mừng bạn $hoten đã đăng ký thành công tại website Salomon</p>".
//						"<p>Vui lòng nhấn vào để kích hoạt: 
//						<a href='http://localhost:1000/salomon/index.php?khoatrang=kichhoat&taikhoan=$TenDangNhap&ma=$randomcode'> 
//http://localhost:1000/salomon/kichhoat.php?taikhoan=$TenDangNhap&ma=$randomcode</a>
//</p>";
//sendGmail("testmailweb02@gmail.com","web02#cusc", "Ban quản trị website Salomon", array(array($email,$hoten)), array(array("testmailweb02@gmail.com", "Ban Quan Tri website Salomon")), "Mail kich hoat tai khoan Salomon", $noidungmail);
//		echo "<script language='javascript'>window.location='index.php'</script>";
		echo "<ul class='cssLoi'>Đăng ký thành công</ul>";
	}
	else {
		echo"<li class=\"Loi\"> Tên đăng nhập hoặc email đã được sử dụng</li>";	
	}
	}
 }

?>
  



</head>

<body>


    <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">

                    <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li>New account / Sign in</li>
                    </ul>

                </div>

                <div class="col-md-6">
                    <div class="box">
                        <h1>Đăng ký</h1>

                        <p class="lead">Bạn chưa phải là thành viên?</p>
                        <p>  </p>
                        <p class="text-muted">Hãy là thành viên của <a href="contact.html">JesterSport</a> để được hưởng những ưu đãi tốt nhất và nhận được thông báo về những dòng sản phẩm mới nhất!! <br> Chúng tôi luôn đón nhận các ý kiến phản hồi của bạn.</p>

                        <hr>

                        <form action="" method="post" role="form">
                            <div class="form-group">
                                <label for="name">Tên đăng nhập:</label>
                                <input type="text" class="form-control" name="txtTenDangNhap" id="txtTenDangNhap">
                            </div>
                            <div class="form-group">
                                <label for="email">Mật khẩu:</label>
                                <input type="text" class="form-control" name="txtMatKhau1" id="txtMatKhau1">
                            </div>
                            <div class="form-group">
                                <label for="password">Nhập lại mật khẩu:</label>
                                <input type="password" class="form-control" name="txtMatKhau2" id="txtMatKhau2">
                            </div>
                             <div class="form-group">
                                <label for="name">Họ và Tên:</label>
                                <input type="text" class="form-control" name="txtHoTen" id="txtHoTen">
                            </div>
                             <div class="form-group">
                                <label for="name">E-mail:</label>
                                <input type="text" class="form-control" name="txtEmail" id="txtEmail">
                            </div>
                             <div class="form-group">
                                <label for="name">Địa chỉ:</label>
                                <input type="text" class="form-control" name="txtDiaChi" id="txtDiaChi">
                            </div>
                             <div class="form-group">
                                <label for="name">Điện thoại:</label>
                                <input type="text" class="form-control" name="txtDienThoai" id="txtDienThoai">
                                 
                            </div>
                              <div class="form-group">
                                <label for="name">Ngày Sinh: &nbsp;</label>
                                  
                                <input type="text" size="5" name="txtNgay" id="txtNgay"  placeholder="Ngay">/
                                  <input type="text" size="5"  name="txtThang" id="txtThang" placeholder="Thang">/
                                  <input type="text" size="8" name="txtNam" id="txtNam" placeholder="Nam">
                                 
                            </div>
                            <div class="form-group">
                                <label for="name">Giới Tính:&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                <label class="radio-inline"><input type="radio" name="grpGioiTinh" value="0">Nam</label>
                                <label class="radio-inline"><input type="radio" name="grpGioiTinh" value="1">Nữ</label>
                            
                            </div>
                   
                            
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-user-md"></i> Đăng Ký</button>
                            </div>
                        </form>
                    </div>
                </div>

                

            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->


       



    </div>
    <!-- /#all -->


    

    <!-- *** SCRIPTS TO INCLUDE ***
 _________________________________________________________ -->
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/modernizr.js"></script>
    <script src="js/bootstrap-hover-dropdown.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/front.js"></script>



</body>

</html>
