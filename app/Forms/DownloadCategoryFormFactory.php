<?php

declare(strict_types = 1);

namespace App\Forms;

use Nette;
use Nette\Application\UI\Form;
use Nette\Security\User;
use Nette\Forms\Container;
use App\Model\DownloadManager;

final class DownloadCategoryFormFactory {

    use Nette\SmartObject;

    /** @var App\Forms\FormFactory */
    private $factory;

    /** @var Nette\Security\User */
    private $user;

    /** @var App\Model\DownloadManager */
    private $downloadManager;


    public function __construct(FormFactory $factory,
                                User $user,
                                DownloadManager $downloadManager) {
        $this->factory = $factory;
        $this->user = $user;
        $this->downloadManager = $downloadManager;
    }

    /**
     * Create form
     * @param type $albumId
     * @param \App\Forms\callable $onSuccess
     * @return Form
     */
    public function create($categoryId, callable $onSuccess): Form {
        
        $form = $this->factory->create();
        
        $form->addText('name', 'Název')
                ->setRequired('Vyplňte Název');

        $form->addSubmit('send', 'Uložit')
                ->setHtmlAttribute('class', 'col-lg-12');

        $form->onSuccess[] = function (Form $form, \stdClass $values) use ($categoryId, $onSuccess): void {

            if (!$categoryId) {
                // Add image category
                $this->downloadManager->addCategory($this->user, $values);
            } else {
                // edit image category
                $this->downloadManager->editCategory($this->user, $categoryId, $values);
            }
            $onSuccess();
        };

        return $form;
    }

}
