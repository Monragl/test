<?php

namespace app\controllers;

use Yii;
use yii\rest\ActiveController;	

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

	// public function beforeAction($action)
	// {

    // 	\Yii::$app->response->format = Response::FORMAT_JSON;
    // 	return parent::beforeAction($action);
	// }
}
