<?php

declare(strict_types = 1);

namespace App\Presenters;

use Nette;
use Nette\Application\UI\Form;
use App\Forms;
use App\Model\DbHandler;
use App\Model\RankManager;

final class RankPresenter extends BasePresenter {

    /** @persistent */
    public $backlink = '';
    
    /** var type object */
    public $editRank;
    
    /** var type int */
    public $rankId;
    
    /** @var App\Model\DbHandler */
    public $dbHandler;
    
    /** @var App\Forms\RankFormFactory */
    private $rankFactory;
    
    /** @var App\Model\RankManager */
    private $rankManager;
    
    
    public function __construct(Forms\RankFormFactory $rankFactory,
                                DbHandler $dbHandler,
                                RankManager $rankManager) {
            $this->rankFactory = $rankFactory;
            $this->dbHandler = $dbHandler;
            $this->rankManager = $rankManager;
    }
    
    /**
     * render default teplate
     */
    public function renderDefault(): void {

            // load ranks
            $this->template->ranks = $this->dbHandler->getOrganisationRanks()->limit(10);
    }
    
    /**
     * Rank form factory.
     */
    protected function createComponentRankForm(): Form {
            return $this->rankFactory->create($this->rankId, function (): void {
                    $this->restoreRequest($this->backlink);
                    $this->flashMessage('Vaše hodnocení bylo uložen, děkujeme.', 'success');
                    $this->redirect('Homepage:default');
                });
    }

    /**
     * Edit rank
     * @param type $id
     */
    public function actionEdit($id): void {
        
            $this->rankId = $id;

            if (!$this->getUser()->isLoggedIn()) {
                $this->flashMessage('Musíte se přihlásit!');
                $this->redirect('Sign:in');
            }

            $editRank = $this->dbHandler->getOrganisationRanks()->get($id);
            $this->editRank = $editRank;

            if (!$editRank) {

                $this->error('Hodnocení nebylo nalezeno');
            }

            $this['rankForm']->setDefaults($editRank->toArray());

            $this->template->rank = $this->dbHandler->getOrganisationRanks()->get($id);
    }
    
    /**
     * Delete rank
     * @param type $id
     */
    public function actionDelete($id): void {
        
            if (!$this->getUser()->isLoggedIn()) {
                $this->redirect('Sign:in');
            }

            $deleteRank = $this->dbHandler->getOrganisationRanks()->get($id);
            if (!$deleteRank) {
                $this->error('Hodnocení nebylo nalezeno');
            }

            $delete = $deleteRank->delete();
            if ($delete) {
                $this->flashMessage('Hodnocení bylo smazáno!', 'success');
                $this->redirect('Homepage:default');
            } else {
                $this->flashMessage('CHYBA: Hodnocení nelze smazat!', 'danger');
                $this->redirect('Homepage:default');
            }
    }
    
}