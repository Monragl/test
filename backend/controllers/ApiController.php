<?php

namespace app\controllers;

use Yii;
use app\models\Users;
use yii\rest\ActiveController;	
use app\models\Login;


class ApiController extends ActiveController
{
	/**
	 * [$modelClass model that callback when it's edit or order]
	 * @var string
	 */
	public $modelClass = 'app\models\Users';
	
	public function actions()
    {
        $actions = parent::actions();
        // print_r($actions);
        return $actions;
    }
	public function actionReg()
	{
		$post = Yii::$app->getRequest()->getBodyParams();
        $model = new Users();

        $model->login = $post['login']??'';
        $model->password = $post['password']??'';
        $model->rolekey = $post['rolekey']??'';
        $model->description = $post['description']??'';
        $model->username = $post['username']??'';

        if ($model->validate()) {
            $model->password = Yii::$app->getSecurity()->generatePasswordHash($model->password);

            $model->api_key = Yii::$app->getRequest()->getCsrfToken();
            $model->date = date('Y-m-d H:i:s');

            $model->save();

            return ['status'=>'204'];
        } else {
            $errors = [
                'error'=>[
                    'code'=>'422',
                    'message'=> 'Validation error',
                    'errors'=>[
                        $model->errors
                    ]
                ]
            ];
            
            return $errors;
        }
	}


	public function actionLogin()
    {   
        $post = Yii::$app->getRequest()->getBodyParams();
        $model = new Login();

        $model->login = $post['login']??'';
        $model->password = $post['password'] ?? '';
        
        
        if ($model->validate()) {
            if(Yii::$app->getSecurity()->validatePassword($post['password'], Users::findOne(['login'=>$post['login']])->password)){
            

                // $model->api_token = Yii::$app->getRequest()->getCsrfToken();

				$user = Users::findOne(['login'=>$post['login']]);
				$user->api_token =  Yii::$app->getRequest()->getCsrfToken();
				$user->save();


                return ['status'=>'204','token'=>$user->api_token];
            }else{
                $errors = [
                    'error'=>[
                        'code'=>'422',
                        'message'=> 'Validation error',
                        'errors'=>[
                            $model->errors
                        ]
                    ]
                ];
                
                return $errors;
            }
        } else {
            $errors = [
                'error'=>[
                    'code'=>'422',
                    'message'=> 'Validation error',
                    'errors'=>[
                        $model->errors
                    ]
                ]
            ];
            
            return $errors;
        }
        
    }
	// public function beforeAction($action)
	// {

    // 	\Yii::$app->response->format = Response::FORMAT_JSON;
    // 	return parent::beforeAction($action);
	// }
}
