<html>
<body>
        <form action="가위바위보게임.php", method="GET">
		<h3>학번 : 2015301027 이름: 김진우</h3><br>
                id : <input type="text" name="id">
		name : <input type="text" name="name"><br>
                가위바위보게임 입력: <input type="text" name="in">
                <input type="submit">
        </form>
       <br>
        <?php
                $user = $_GET['id'];    
		$username = $_GET['name'];
                $na = $_GET['in'];     

                $id = "kimjino1527";
                $pw = "Rlawlsdn2";
                $dbname = "kimjino1527";


                $link = mysql_connect("localhost", $id, $pw) or die("DB Fail!");              
                mysql_select_db($dbname, $link) or die($dbname." open fail!");
		
		// id가 같은 값이 없다면 추가	
		$q = "insert into kawi (id, name) values ('$user', '$name') on duplicate key update id='$user'";
                $res = mysql_query($q, $link);

              
                $q = "select * from kawi";
		$res = mysql_query($q, $link);

                $row = mysql_fetch_array($res);
		
		
		
		

                $com = rand(0,2);       // 컴퓨터가 낸 것
                $rcp = array("가위", "바위", "보");

                // 사용자  상태
                $win = $row['win'];
                $lose = $row['lose'];
                $tie = $row['tie'];
                $tot = $row['tot'];
                $tot++;
                
                echo $row['id']."씨는 ".$na."를 냈습니다.<br>";
                echo "컴퓨터는 ".$rcp[$com]."를 냈습니다.<br>";
                switch($com){
                        case 0: // 가위
                                if($na == "가위"){
                                        echo $row['id']."씨는 비겼습니다.<br>";
                                        $tie++;
                                }
                                else if($na == "바위"){
                                        echo $row['id']."씨는 이겼습니다.<br>";
                                        $win++;
                                }
                                else if($na == "보"){
                                        echo $row['id']."씨는 졌습니다.<br>";
                                        $lose++;
                                }
                                break;
                        case 1: // 바위
                                if($na == "가위"){
                                        echo $row['id']."씨는 졌습니다.<br>";
                                        $lose++;
                                }
                                else if($na == "바위"){
                                        echo $row['id']."씨는 비겼습니다.<br>";
                                        $tie++;
                                }
                                else if($na == "보"){
                                        echo $row['id']."씨는 이겼습니다.<br>";
                                        $win++;
                                }
                                break;
                        case 2: // 보
                                if($na == "가위"){
                                        echo $row['id']."씨는 이겼습니다.<br>";
                                        $win++;
                                }
                                else if($na == "바위"){
                                        echo $row['id']."씨는 졌습니다.<br>";
                                        $lose++;
                                }
                                else if($na == "보"){
                                        echo $row['id']."씨는 비겼습니다.<br>";
                                        $tie++;
                                }
                                break;
                }
                echo "<br>";

                echo "실행횟수 : ".$tot."<br>";
                echo $win."번 승리, ".$lose."번 패배, ".$tie."번 무승부<br>";
                echo "승률: ";
                printf("%.2f",$win/$tot*100);
                echo "%<br>";
		
		// 데이터 업데이트
		$q = "update kawi set id='$user', name='$username', win='$win', lose='$lose', tie='$tie', tot='$tot' where id='$user'";
                $res = mysql_query($q, $link) or die("update fail");

		
		$q = "select * from kawi";
                $res = mysql_query($q, $link);
		
		// 표로  출력		
    	        echo "</table>\n<br><table border='1'>";
		echo "<th>id</th><th>name</th><th>win</th><th>lose</th><th>tie</th><th>tot</th>";
  	        while( $n=mysql_fetch_row($res) ) {
	        echo "<tr>";
      	        foreach($n as $k=>$v) echo "<td>".$v."</td>";
	        echo "</tr>";
	        }
		
                mysql_close($line);
        ?>
</body>
</html>

