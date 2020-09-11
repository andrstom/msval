<?php
declare(strict_types = 1);

namespace App\Model;

use Nette;
use App\Model\FileManager;

class DownloadManager {

    use Nette\SmartObject;

    // set database details
    private const
            TABLE_FILES = 'files',
            TABLE_FILES_CATEGORY = 'files_category',
            COLUMN_ID = 'id',
            COLUMN_FILENAME = 'filename',
            COLUMN_NAME = 'name',
            COLUMN_SHORT_NAME = 'short_name',
            COLUMN_DESCRIPTION = 'description',
            COLUMN_CATEGORY_ID = 'category_id',
            COLUMN_URL = 'url',
            COLUMN_CREATOR = 'creator',
            COLUMN_CREATED_AT = 'created_at',
            COLUMN_EDITOR = 'editor',
            COLUMN_EDITED_AT = 'edited_at';


    /** @var Nette\Database\Context */
    private $database;
    
    /** @var App\Model\FileManager */
    private $fileManager;
    
    
    public function __construct(Nette\Database\Context $database,
                                FileManager $fileManager) {
            $this->database = $database;
            $this->fileManager = $fileManager;
    }

    /**
     * Upload file and insert details into db
     * @param type $logged_user
     * @param type $values
     * @throws DownloadException
     */
    public function addFile($logged_user, $values): void {

        // upload file and insert details into db
        foreach ($values->formFiles as $k => $file) {

            if ($file->filename->hasFile()) {

                $path = $this->fileManager->setPath($file->filename);
                $filename = $this->fileManager->setFilename($file->filename) . $this->fileManager->getSuffix($file->filename);
                $url = $path . $filename;

                // upload file
                try {

                    $upload = $this->fileManager->uploadFile($file->filename);
                } catch (\Exception $e) {
                    throw new DownloadException('Chyba při nahrávání souboru ' . $filename . ' (detail - \App\Model\DownloadManager::addFile()->uploadFile())' . $e->getMessage() . '\n');
                }

                // insert into db
                try {
                    $insertImage = $this->database->table(self::TABLE_FILES)->insert([
                        self::COLUMN_FILENAME => $filename,
                        self::COLUMN_DESCRIPTION => $file->description,
                        self::COLUMN_CATEGORY_ID => $file->category_id,
                        self::COLUMN_URL => $url,
                        self::COLUMN_CREATOR => $logged_user->getIdentity()->getData()['email'],
                        self::COLUMN_CREATED_AT => time()
                    ]);
                } catch (\Exception $e) {
                    throw new DownloadException('Chyba při ukládání obrázku do databáze (detail - \App\Model\DownloadManager::addFile()->insertImage)' . $e->getMessage() . '\n');
                }
            }
        }
    }

    /**
     * Edit details
     * @param type $logged_user
     * @param type $values
     * @param type $fileId
     * @throws DownloadException
     */
    public function editFile($logged_user, $values, $fileId): void {

        // update
        try {

            $updateFile = $this->database->table(self::TABLE_FILES)->get($fileId);
            $update = $updateFile->update([
                self::COLUMN_DESCRIPTION => $values->description,
                self::COLUMN_CATEGORY_ID => $values->category_id
            ]);
        } catch (\Exception $e) {
            throw new DownloadException('Změnu nelze provést! (detail - \App\Model\DownloadManager::editFile())' . $e->getMessage() . '\n');
        }
    }

    /**
     * Add category
     * @param type $logged_user
     * @param type $values
     * @throws DownloadException
     */
    public function addCategory($logged_user, $values): void {

        // sanitize name to short-name
        $short_name = strtolower(str_replace(' ', '-', $this->fileManager->diacriticSubstract($values->name)));

        // insert into db
        try {
            $insertCategory = $this->database->table(self::TABLE_FILES_CATEGORY)->insert([
                self::COLUMN_SHORT_NAME => $short_name,
                self::COLUMN_NAME => $values->name
            ]);
        } catch (\Exception $e) {
            throw new DownloadException('Chyba při vkládání kategorie do databáze (detail - \App\Model\DownloadManager::addCategory())' . $e->getMessage() . '\n');
        }
    }

    /**
     * Edit category
     * @param type $logged_user
     * @param type $categoryId
     * @param type $values
     * @throws DownloadException
     */
    public function editCategory($logged_user, $categoryId, $values): void {

        // sanitize filename
        $short_name = strtolower(str_replace(' ', '-', $this->fileManager->diacriticSubstract($values->name)));

        // update category
        try {

            $updateCategory = $this->database->table(self::TABLE_FILES_CATEGORY)->get($categoryId);
            $update = $updateCategory->update([
                self::COLUMN_SHORT_NAME => $short_name,
                self::COLUMN_NAME => $values->name
            ]);
        } catch (\Exception $e) {
            throw new DownloadException('Chyba při ukládání změny do databáze (detail - \App\Model\DownloadManager::editCategory())' . $e->getMessage() . '\n');
        }
    }
}

class DownloadException extends \Exception {}
