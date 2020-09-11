<?php

declare(strict_types = 1);

namespace App\Forms;

use Nette;
use Nette\Application\UI\Form;
use Nette\Security\User;
use Nette\Forms\Container;
use App\Model\DownloadManager;
use App\Model\FileManager;
use App\Model\DbHandler;

final class DownloadFormFactory {

    use Nette\SmartObject;

    /** @var App/Forms/FormFactory */
    private $factory;

    /** @var Nette\Security\User */
    private $user;

    /** @var App\Model\DbHandler */
    private $dbHandler;
    
    /** @var App\Model\DownloadManager */
    private $downloadManager;
    
    /** @var App\Model\FileManager */
    private $fileManager;

    public function __construct(DbHandler $dbHandler,
                                FormFactory $factory,
                                User $user,
                                DownloadManager $downloadManager,
                                FileManager $fileManager) {
                $this->dbHandler = $dbHandler;
                $this->factory = $factory;
                $this->user = $user;
                $this->downloadManager = $downloadManager;
                $this->fileManager = $fileManager;
    }

    /**
     * Create form
     * @param \App\Forms\callable $onSuccess
     * @return Form
     */
    public function create(callable $onSuccess): Form {
        
        $form = $this->factory->create();
        
        // set dafault number of samples
        $copies = 1;

        // set maximum samples
        $maxCopies = 20;

        $multiplier = $form->addMultiplier('formFiles', function (Container $container, Form $form) {

            $container->addUpload('filename', 'Soubor')
                    ->setHtmlAttribute('class', 'col-lg-12')
                    ->addRule(Form::MAX_FILE_SIZE, 'Maximální velikost souboru je 5 MB.', 5000 * 1024)
                    ->addRule(function ($control) {
                        $filename = strtolower(str_replace(' ', '_', $this->fileManager->diacriticSubstract($control->value->name)));
                        return !$this->dbHandler->getFiles()->where('filename = ?', $filename)->fetch();
                    }, 'Soubor s tímto názvem již existuje! Případně změňte název souboru (nikoliv jeho popis)!');

            $container->addText('description', 'Název')
                    ->setRequired('Vyplňtě Název')
                    ->setHtmlAttribute('class', 'col-lg-12');
            
            $container->addSelect('category_id', 'Kategorie:', $this->dbHandler->getFileCategory()->fetchPairs('id', 'name'));

        }, $copies, $maxCopies);

        $multiplier->addCreateButton('Přidat')
                ->setValidationScope([])
                ->addClass('col-lg-3');
        $multiplier->addCreateButton('Přidat (5x)', 5)
                ->setValidationScope([])
                ->addClass('col-lg-3');
        $multiplier->addRemoveButton('X')
                ->addClass('col-lg-3 btn btn-danger');
        
        $form->addSubmit('send', 'Uložit')
                ->setHtmlAttribute('class', 'col-lg-12');

        $form->onSuccess[] = function (Form $form, \stdClass $values) use ($onSuccess): void {

            // Add file
            $this->downloadManager->addFile($this->user, $values);

            $onSuccess();
        };

        return $form;
    }

}
