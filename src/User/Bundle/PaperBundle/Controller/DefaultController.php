<?php

namespace User\Bundle\PaperBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
class DefaultController extends Controller
{
    public function indexAction(Request $request )
    {  
    
    	$conn = $this->get('doctrine.dbal.default_connection');
    	$users = $conn->fetchAll('SELECT * FROM user');    
        return $this->render('UserPaperBundle:Default:index.html.twig', array('name' => "xieyaokun"));
    }
    public function loginAction(Request $request){
    	return $this->render("UserPaperBundle:admin:login.html.twig");
    }
}
