<body><h3>서울시 주요 공원 현황(Open Data)</h3><p>
   <form action="opendata.php" method="POST">
     검색 항목 선택<br>
     <input type="checkbox" name="check[]" value="pno"/> 공원번호 
     <input type="checkbox" name="check[]"  value="pname"/> 공원이름
     <input type="checkbox" name="check[]"  value="area"/> 면적 
     <input type="checkbox" name="check[]"  value="sdate"/> 개원일 
     <input type="checkbox" name="check[]"  value="region"/> 지역 
     <input type="checkbox" name="check[]"  value="tel"/> 전화번호 <br>
     <input type="submit"><br><br>
   
   </form> 
   <?php
     for($i=0; $i<count($_POST['check']); $i++){
     	$position = $_POST['check'];
     }
     $myid = "kimjino1527";
     $mydb = "kimjino1527";
     $mytab = "park";
     $watchtab = "watchdata";
     $link=mysql_connect("localhost",$myid,"Rlawlsdn2") or die("DB Fail!");
     mysql_select_db($mydb,$link);
    
     // ip가 같은 값이 없다면 추가
     $ip = $_SERVER['REMOTE_ADDR'];
     $q3 = "insert into watchdata (ip) values ('$ip') on duplicate key update ip = '$ip'";
     $res3 = mysql_query($q3,$link);

      // watch query 문 작성 (조회수 +1)
      if($position != null){
         $q2 = "update ".$watchtab." set ";

         for($i=0; $i<count($_POST['check']); $i++){
           $q2 .= $position[$i]." = ".$position[$i]." + 1";
           if($i!=(count($_POST['check']))-1)
            $q2 .= ", ";

         } $q2 .= " where ip = '".$ip."';";
       }
       $res2 = mysql_query($q2, $link);



     // watch query 문 작성 (조회수 +1)
     if($position != null){
        $q2 = "update ".$watchtab." set ";

        for($i=0; $i<count($_POST['check']); $i++){
          $q2 .= $position[$i]." = ".$position[$i]." + 1";
          if($i!=(count($_POST['check']))-1)
           $q2 .= ", ";

        } $q2 .= " where ip = 'SUM';"; 
      }
      $res2 = mysql_query($q2, $link);
    
      // client 별 조회수 출력
      echo "Client 별 검색도<br>";
      $q4 = "select * from watchdata";
      $res4 = mysql_query($q4, $link);
      echo "<table border=1>";
      echo "<th>ip</th><th>pno</th><th>pname</th><th>area</th><th>sdate</th><th>region</th><th>tel</th>";
      while( $n=mysql_fetch_row($res4) ) {
        echo "<tr>";
        foreach($n as $k=>$v) echo "<td>".$v."</td>";
        echo "</tr>";
      }
      echo "</table>\n<br>";

     // 조회수 TOP5  출력
     echo "조회수 TOP 5<br>";
     $tmp = array();
     $q5 = "select pno, pname, area, sdate, region, tel from watchdata where ip='SUM'";
     $res5 = mysql_query($q5, $link);
     echo "<table border=1>";
     while( $n=mysql_fetch_row($res5) ) {
       foreach($n as $k=>$v) $tmp[$k] = $v;
     }
     $arr = ['pno'=>$tmp[0],'pname'=>$tmp[1],'area'=>$tmp[2],'sdate'=>$tmp[3],'region'=>$tmp[4],'tel'=>$tmp[5]];
     arsort($arr);
     array_splice($arr, 1,1);
     foreach($arr as $key=>$value){
	echo "<th>".$key."</th>";
     }
	echo "<tr>";
     foreach($arr as $key=>$value){
	echo "<td>".$value."</td>";
     }
 	echo "</tr>";

     echo "</table>\n<br>";

     

     // query문 작성
      if($position != null){
       $q = "select ";

       for($i=0; $i<count($_POST['check']); $i++){
         $q .= $position[$i];
         if($i!=(count($_POST['check']))-1)
	  $q .= ", ";

       } $q .= " from $mytab";
     }

     
     // 테이블 출력
     echo "검색 내역<br>";
     $res = mysql_query($q,$link);
     echo "<table border=1>";
      for($i=0; $i<count($_POST['check']); $i++){
          echo "<th>". $position[$i]."</th>";
        }
     while( $n=mysql_fetch_row($res) ) {
       echo "<tr>";
       foreach($n as $k=>$v) echo "<td>".$v."</td>";
       echo "</tr>";
     }
     echo "</table>\n<br>";
     mysql_close($link);
   ?>
   </table>
   </body>
