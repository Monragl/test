<?php

namespace app\models;

use yii\db\ActiveRecord;
use yii\web\IdentityInterface;


class Users extends ActiveRecord implements IdentityInterface
{
    public $api_token;

    
    /**
     * @return string название таблицы, сопоставленной с этим ActiveRecord-классом.
     */
    public static function tableName()
    {
        return '{{users}}';
    }

   
    public static function findIdentityByAccessToken($token, $type = null)
    {
        return Users::findOne(['api_token' => $token]);
    }

    public static function findIdentity($id)
    {
        return static::findOne($id);
    }
    public function getId()
    {
        return $this->id;
    }
    public function getAuthKey(){}

    public static function validateUser($name,$pass){
        return Users::findOne(['name'=>$name,'password'=>$pass]);
    }

    public function validateAuthKey($authKey){}
    public function rules()
    {
        return [
            // атрибут required указывает, что name, email, subject, body обязательны для заполнения
            [['login', 'password', 'rolekey', 'description','username'], 'required'],
            ['login','validateLogin'],
        ];
        
    }
    public function validateLogin($attribute, $params)
    {
        if (!empty(Users::findOne(['login'=>$this->$attribute]))) {
            $this->addError($attribute, 'No uniq login');
        }
    }
    

}