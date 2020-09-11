<?php

declare(strict_types = 1);

namespace App\Model;

use Nette;
use App\Forms\RankFormFactory;
use App\Model\EmailManager;

class RankManager {

    use Nette\SmartObject;

    // set database details
    private const
            TABLE_RANKS = 'organisation_ranks',
            COLUMN_ID = 'id',
            COLUMN_TITLE = 'title',
            COLUMN_CONTENT = 'content',
            COLUMN_STARS = 'stars',
            COLUMN_CREATOR = 'creator',
            COLUMN_CREATED_AT = 'created_at',
            COLUMN_EDITOR = 'editor',
            COLUMN_EDITED_AT = 'edited_at';

    /** @var Nette\Database\Context */
    private $database;
    
    /** @var App\Model\EmailManager */
    private $emailManager;
    
    
    public function __construct(Nette\Database\Context $database,
                                EmailManager $emailManager) {
            $this->database = $database;
            $this->emailManager = $emailManager;
    }

    /**
     * Adds rank
     * @param type $values
     * @throws RankException
     */
    public function add($values): void {

        try {

            // insert rank into db
            $insertRank = $this->database->table(self::TABLE_RANKS)->insert([
                self::COLUMN_TITLE => $values->title,
                self::COLUMN_CONTENT => $values->content,
                self::COLUMN_STARS => $values->stars,
                self::COLUMN_CREATOR => $values->creator,
                self::COLUMN_CREATED_AT => time()
            ]);
            
            
        } catch (\Exception $e) {
            throw new RankException('Chyba při ukládání hodnocení! (detail - \App\Model\RankManager::add()->insertRank ' . $e->getMessage() . ')');
        }
        
        // send email
        try {
            
            $this->emailManager->sendRank($insertRank->id, $values->title, $values->content, $values->stars, $values->creator);
            
        } catch (\Exception $e) {
            throw new RankException('Chyba při odeslání emailu s hodnocením! (detail - \App\Model\RankManager::add() ' . $e->getMessage() . ')');
        }
        
    }

    /**
     * Edit rank
     * @param type $logged_user
     * @param type $values
     * @param type $rankId
     * @throws RankException
     */
    public function edit($logged_user, $values, $rankId): void {

        // update rank
        try {

            $rank = $this->database->table(self::TABLE_RANKS)->get($rankId);
            $rank->update([self::COLUMN_TITLE => $values->title,
                self::COLUMN_CONTENT => $values->content,
                self::COLUMN_STARS => $values->stars,
                self::COLUMN_EDITOR => $logged_user->getIdentity()->getData()['email'],
                self::COLUMN_EDITED_AT => time()
            ]);
        } catch (\Exception $e) {
            throw new RankException('Chyba při ukládání hodnocení do db! (detail - \App\Model\RankManager::edit())' . $e->getMessage());
        }

    }
}

class RankException extends \Exception {}