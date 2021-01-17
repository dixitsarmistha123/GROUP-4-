<?php

namespace App\EventSubscriber;

use App\Entity\Comment;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use EasyCorp\Bundle\EasyAdminBundle\Event\BeforeEntityPersistedEvent;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\String\Slugger\SluggerInterface;

    class CommentSubscriber implements EventSubscriberInterface {
        private $slugger;

        public function __construct(Security $security, SluggerInterface $slugger) {
            $this->slugger = $slugger;
            $this->security = $security;
        }

        public static function getSubscribedEvents(){
            return  [
                BeforeEntityPersistedEvent::class => ['setPost'],
                //BeforeEntityPersistedEvent::class =>['setUser'],
               
            ];
        }

        public function setPost(BeforeEntityPersistedEvent $event){
            $entity = $event->getEntityInstance();
            if ($entity instanceof Comment) {
               $entity->setUser($this->security->getUser());
                $entity->setCreatedAt(new \DateTime());
               
                
            }
            
            return;
        }

    
    }
