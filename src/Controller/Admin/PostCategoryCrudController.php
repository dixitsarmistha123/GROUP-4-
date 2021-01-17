<?php

namespace App\Controller\Admin;

use App\Entity\PostCategory;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use Symfony\Component\HttpFoundation\Session\Session;

class PostCategoryCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return PostCategory::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->hideOnForm(),
            TextField::new('category_name'),
            TextEditorField::new('description'),
            AssociationField::new('parent'),
            BooleanField::new('status'),
            DateTimeField::new('created')->hideOnForm(),
            DateTimeField::new('updated')->hideOnForm(),
        ];
    }
    public function configureActions(Actions $actions): Actions
    {
        return $actions
            // ...
           
            ->setPermission(Action::EDIT, 'ROLE_ADMIN')
            ->setPermission(Action::DELETE, 'ROLE_ADMIN')
        ;
    }
     /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id )
    {
       //  $pc = new PostCategory(); 
            
        //  $pc->$this->setPostCategory()
            
        $entityManager = $this->getDoctrine()->getManager();
       $category =$this->getDoctrine()->getRepository(PostCategory::class)->find($id);
      $category->posts()->setPostCategory(2);
      

                    $entityManager->persist($category);
                    $entityManager->flush();       
     
      $category->delete();
      return $this->addFlash('success', 'The tag was successfully deleted.'); 

      //return redirec()->route('categories.index');
    }
}
