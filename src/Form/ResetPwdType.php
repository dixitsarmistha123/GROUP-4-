<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ResetPwdType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder

        ->add('oldpassword', PasswordType::class, array(

            'mapped' => false

        ))

        ->add('password', RepeatedType::class, array(

            'type' => PasswordType::class,

            'invalid_message' => 'Les deux mots de passe doivent être identiques',

            'options' => array(

                'attr' => array(

                    'class' => 'password-field'

                )

            ),

            'required' => true,

        ))

        ->add('submit', SubmitType::class, array(

            'attr' => array(

                'class' => 'btn btn-primary btn-block'

            )

        ))

    ;
        /* $builder
            ->add('first_name')
            ->add('last_name')
            ->add('email')
            ->add('roles')
            ->add('password')
            ->add('mobile')
            ->add('dob')
            ->add('gender')
            ->add('status')
            ->add('created')
            ->add('updated')
        ; */
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
