<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<<style>
ul{
  float: right;
  list-style-type: none;
  margin-top: 25px;
}

ul li{
	display: inline-block;

}

ul li a{
	text-decoration: none;
	color: #fff;
	padding: 5px 20px;
	border: 1px solid #fff;
	padding-left: 50px;
}

ul li a:hover{
	background-color: black;
	
}

.sub-main{
	display: none;
}

ul li:hover .sub-main{
	display: block;
	position: absolute;
	background color: black;:
	margin-top: 25px;

}

ul li:hover .sub-main ul{
	display: block;
	margin: 10px;
}

ul li:hover .sub-main ul li{
	display: block;
	width: 150px;
	padding: 10px;
	border-radius: 0px;
	text-align: left;
}
</style>
<form class="/logout">
    <div class=main>
        <ul>
          <li ><a href="#">Hi, ${sessionScope.username}</a>
          <div class="sub-main">
            <ul>
              <li><a><button>Logout</button></a></li>
              <li><a href="#">Profile</a></li>
            </ul>
          </div>
         </li>
        
        </ul>  
    </div>
    </form>