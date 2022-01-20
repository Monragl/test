<?php

namespace app\models;

use yii\db\ActiveRecord;
use yii\web\IdentityInterface;


class Users extends ActiveRecord implements IdentityInterface
{

    
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
            [['first_name', 'phone', 'last_name', 'document_number','password'], 'required'],
            ['phone','validatePhone'],
            ['document_number', 'validateDocumentNumber']
        ];
        
    }
    public function validatePhone($attribute, $params)
    {
        if (!empty(Users::findOne(['phone'=>$this->$attribute]))) {
            $this->addError($attribute, 'No uniq phone');
        }
    }
    public function validateDocumentNumber($attribute,$params)
    {
        if (strlen($this->$attribute)!= 10) {   
            $this->addError($attribute, 'Lenght must be 10 chartes');
        }elseif(!is_numeric($this->$attribute)){
            $this->addError($attribute, 'String must contain only цыфры');
        }
    }

}