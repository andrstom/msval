<?php

declare(strict_types = 1);

namespace App\Presenters;

use Nette;
use Nette\Application\UI\Form;
use Nette\Utils\FileSystem;
use App\Forms;
use App\Model\DbHandler;

final class DownloadPresenter extends BasePresenter {

    /** @persistent */
    public $backlink = '';
    
    /** @var type */
    private $categoryId;
    
    /** @var type */
    private $fileId;
    
    /** @var type */
    private $edit;
    
    /** @var type */
    private $editFile;
    
    /** @var App\Model\DbHandler */
    private $dbHandler;
    
    /** @var App\Forms\DownloadFormFactory */
    private $downloadFactory;
    
    /** @var App\Forms\DownloadEditFormFactory */
    private $downloadEditFactory;
    
    /** @var App\Forms\DownloadCategoryFormFactory */
    private $downloadCategoryFactory;
    
    public function __construct(DbHandler $dbHandler,
                                Forms\DownloadFormFactory $downloadFactory,
                                Forms\DownloadEditFormFactory $downloadEditFactory,
                                Forms\DownloadCategoryFormFactory $downloadCategoryFactory) {
            $this->dbHandler = $dbHandler;
            $this->downloadFactory = $downloadFactory;
            $this->downloadEditFactory = $downloadEditFactory;
            $this->downloadCategoryFactory = $downloadCategoryFactory;
    }

    public function renderDefault(): void {

            // load file
            $this->template->files = $this->dbHandler->getFiles();

    }
    
    public function renderAddCategory(): void {

            // load file
            $this->template->fileCategories = $this->dbHandler->getFileCategory()->order('name ASC');

    }
    
    /**
     * Download form factory.
     */
    protected function createComponentDownloadForm(): Form {
            return $this->downloadFactory->create(function (): void {
                    $this->restoreRequest($this->backlink);
                    $this->flashMessage('Uloženo.');
                    $this->redirect('Download:default');
                });
    }
    
    /**
     * Download edit form factory.
     */
    protected function createComponentDownloadEditForm(): Form {
            return $this->downloadEditFactory->create($this->fileId, function (): void {
                    $this->restoreRequest($this->backlink);
                    $this->flashMessage('Uloženo.');
                    $this->redirect('Download:default');
                });
    }
    
    /**
     * Download album form factory.
     */
    protected function createComponentDownloadCategoryForm(): Form {
            return $this->downloadCategoryFactory->create($this->categoryId, function (): void {
                    $this->restoreRequest($this->backlink);
                    $this->flashMessage('Uloženo.');
                    $this->redirect('Download:addCategory');
                });
    }
    
    /**
     * Edit file
     * @param type $id
     */
    public function actionEditFile($id): void {
        
        $this->fileId = $id;
        
        if (!$this->getUser()->isLoggedIn()) {
            $this->flashMessage('Musíte se přihlásit!');
            $this->redirect('Sign:in');
        }

        $editFile = $this->dbHandler->getFiles()->get($id);
        $this->editFile = $editFile;

        if (!$editFile) {
            $this->error('Soubor nebyl nalezen!');
        }

        $this['downloadEditForm']->setDefaults($editFile->toArray());
        
        $this->template->file = $this->dbHandler->getFiles()->get($id);
    }
    
    /**
     * Delete file
     * @param type $id
     */
    public function actionDeleteFile($id): void {
        
        if (!$this->getUser()->isLoggedIn()) {
            $this->redirect('Sign:in');
        }

        $deleteFile = $this->dbHandler->getFiles()->get($id);
        if (!$deleteFile) {
            
            $this->error('Obrázek nebyl nalezen!');
            
        }
        
        // delete file
        if (file_exists('.' . $deleteFile->url)){
           Filesystem::delete('.' . $deleteFile->url);
        }

        // delete file from db
        $delete = $deleteFile->delete();
        
        if ($delete) {
            $this->flashMessage('Soubor byl odstraněn!', 'success');
            $this->redirect('Download:default');
        } else {
            $this->flashMessage('CHYBA: Soubor nelze odstranit!', 'danger');
            $this->redirect('Download:default');
        }
    }

    /**
     * Edit category
     * @param type $id
     */
    public function actionEditCategory($id): void {

            $this->categoryId = $id;

            if (!$this->getUser()->isLoggedIn()) {
                $this->flashMessage('Musíte se přihlásit!');
                $this->redirect('Sign:in');
            }

            $edit = $this->dbHandler->getFileCategory()->get($id);
            $this->edit = $edit;

            if (!$edit) {
                $this->error('Kategorie nebyla nalezena!');
            }

            $this['downloadCategoryForm']->setDefaults($edit->toArray());

            $this->template->downloadCategories = $this->dbHandler->getFileCategory()->get($id);
    }
    
    /**
     * Delete category
     * @param type $id
     */
    public function actionDeleteCategory($id): void {

            if (!$this->getUser()->isLoggedIn()) {
                $this->redirect('Sign:in');
            }

            $deleteCategory = $this->dbHandler->getFileCategory()->get($id);
            if (!$deleteCategory) {
                $this->error('Kategorie nebyla nalezena!');
            }

            // change category for exist images to default
            $images = $this->dbHandler->getFiles();
            foreach ($images->where('category_id ?', $id) as $file) {
                $file->update(['category_id' => 1]);
            }

            // category with id = 1 is not possible to delete
            if ($id != 1) {
                $delete = $deleteCategory->delete();
            }

            if ($delete) {
                $this->flashMessage('Kategorie byla odstraněna!', 'success');
                $this->redirect('Download:addCategory');
            } else {
                $this->flashMessage('Kategorii nelze odstranit!', 'danger');
                $this->redirect('Download:addCategory');
            }
    }
}
