<?php

namespace app\models;

use Yii;
use yii\base\Model;
use app\models\Users;

/**
 * Login is the model behind the login .
 *
 * @property-read User|null $user This property is read-only.
 *
 */
class Login extends Model
{
    public $login;
    public $password;
    public $api_token;
    

    private $_user = false;

    


    

    /**
     * @return array the validation rules.
     */
    public function rules()
    {
        return [
            [['login', 'password'], 'required'],
            ['login', 'validateLogin']
            
        ];
    }


    /**
     * Validates the password.
     * This method serves as the inline validation for password.
     *
     * @param string $attribute the attribute currently being validated
     * @param array $params the additional name-value pairs given in the rule
     */
    public function validateLogin($attribute, $params)
    {
        if (!Users::findOne(['login'=>$this->$attribute])) {
            $this->addError($attribute, 'No user or password');
        }
    }
   
}
