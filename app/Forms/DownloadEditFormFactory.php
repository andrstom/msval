<?php
declare(strict_types = 1);

namespace App\Forms;

use Nette;
use Nette\Application\UI\Form;
use Nette\Security\User;
use App\Model\DownloadManager;
use App\Model\DbHandler;

final class DownloadEditFormFactory {

    use Nette\SmartObject;

    /** @var FormFactory */
    private $factory;

    /** @var Nette\Security\User */
    private $user;

    /** @var App\Model\DbHandler */
    private $dbHandler;
    
    /** @var App\Model\DownloadManager */
    private $downloadManager;

    
    public function __construct(DbHandler $dbHandler,
                                FormFactory $factory,
                                User $user,
                                DownloadManager $downloadManager) {
                $this->dbHandler = $dbHandler;
                $this->factory = $factory;
                $this->user = $user;
                $this->downloadManager = $downloadManager;
    }

    /**
     * Create form
     * @param \App\Forms\callable $onSuccess
     * @return Form
     */
    public function create($fileId, callable $onSuccess): Form {
        
        $form = $this->factory->create();
        
        $form->addText('description', 'Popis')
                    ->setHtmlAttribute('class', 'col-lg-12');
            
        $form->addSelect('category_id', 'Kategorie', $this->dbHandler->getFileCategory()->fetchPairs('id', 'name'));

        $form->addSubmit('send', 'Uložit')
                ->setHtmlAttribute('class', 'col-lg-12');

        $form->onSuccess[] = function (Form $form, \stdClass $values) use ($fileId, $onSuccess): void {

            // edit
            $this->downloadManager->editFile($this->user, $values, $fileId);

            $onSuccess();
        };

        return $form;
    }

}
