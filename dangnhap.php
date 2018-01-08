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
    //code Đăng nhập
if(isset($_POST['btnDangNhap'])){
	$TenDangNhap = $_POST['txtTenDangNhap'];
	$MatKhau = $_POST['txtMatKhau'];
	echo"";
}
else{
	echo"";
}
?>

<?php

if(isset($_POST['btnDangNhap'])){
	$txtTenDangNhap = $_POST['txtTenDangNhap'];
	$txtMatKhau = $_POST['txtMatKhau'];
	$loi = "";
    if($TenDangNhap==""){
		$loi.="<li class='loi'>Vui lòng nhập tên đăng nhập!!!</li>";
	}
	if($MatKhau==""){
		$loi.="<li class='loi'>Vui lòng nhập mật khẩu!!!</li>";
	}
	if($loi!=""){
		echo $loi;
	}
	else {
		$MatKhau = md5($MatKhau);
		$result = mysqli_query($conn," SELECT * FROM taikhoan WHERE username_kh='$TenDangNhap' AND password_kh='$MatKhau' ") or die(mysqli_error($conn));
//        AND kh_trangthai=1
		if(mysqli_num_rows($result)==1){
				$row = mysqli_fetch_array($result, MYSQLI_ASSOC);
				$_SESSION["tendangnhap"] = $TenDangNhap;
				$_SESSION["quantri"] = $row["loaitk"];
                
				echo "<script language='javascript'>window.location='index.html'</script>";
                echo "<ul class='cssLoi'>Đăng nhập thành công</ul>";
		}
		else {
				echo"Đăng nhập thất bại!!!";
		}
	}
}
?>