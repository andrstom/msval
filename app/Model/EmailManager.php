<?php
declare(strict_types=1);

namespace App\Model;

use Nette;
use Nette\Mail\Message;
use Nette\Mail\IMailer;
use Nette\Application\LinkGenerator;
use Nette\Bridges\ApplicationLatte\ILatteFactory;



class EmailManager {
    
    /** @var Nette\Mail\IMailer */
    private $mailer;
    
    /** @var Nette\Application\LinkGenerator */
    private $linkGenerator;
    
    /** @var Nette\Bridges\ApplicationLatte\ILatteFactory */
    private $latteFactory;
    
    /** @var Nette\Database\Context */
    private $database;
    
    /**
     * @param Nette\Database\Context $database
     * @param IMailer $mailer
     * @param LinkGenerator $linkGenerator
     * @param ILatteFactory $latteFactory
     */
    public function __construct(Nette\Database\Context $database,
                                IMailer $mailer,
                                LinkGenerator $linkGenerator,
                                ILatteFactory $latteFactory) {
            $this->database = $database;
            $this->mailer = $mailer;
            $this->linkGenerator = $linkGenerator;
            $this->latteFactory = $latteFactory;
    }
    
    /**
     * Send newsletter
     * 
     * @param type $articleId
     * @throws EmailException
     */
    public function sendNewsleter($articleId): void {
    
        $organisation = $this->database->table('organisation')->get(1);

        // load confirmed emails
        $emails = $this->database->table('newsletter')->where('confirmed ?', 'ANO')->fetchAll();

        // load article
        $article = $this->database->table('articles')->get($articleId);

        // create latte
        $latte = $this->latteFactory->create();

        // macro "{link}, n:href" instaliation to $latte
        Nette\Bridges\ApplicationLatte\UIMacros::install($latte->getCompiler());
        $latte->addProvider('uiControl', $this->linkGenerator);
        
        foreach ($emails as $email) {
            
            // set parameters (used as {link} in .latte template)
            $params = [
                'email' => $email->email,
                'title' => $article->title,
                'content' => $article->content
            ];

            // html content from latte template
            $html = $latte->renderToString(__DIR__ . '/newsletter.latte', $params);

            // create mail
            $mail = new Message();
            $mail->setFrom($organisation->short_name . ' <' . $organisation->email . '>');
            $mail->addTo($email->email);
            $mail->setSubject($organisation->short_name . ' - Aktualita');
            $mail->setHtmlBody($html);
            
            // send mail
            if($mail) {
                try {
                    
                    $this->mailer->send($mail);
                    
                } catch (\EmailException $e) {
                    throw new EmailException('Chyba při odesílání newsletteru! (' . $e->getMessage() . ')');
                }
            }
        }
    }
    
    public function sendNewsleterRegistration($email, $token): void {

        $organisation = $this->database->table('organisation')->get(1);

        // create latte
        $latte = $this->latteFactory->create();

        // macro "{link}, n:href" instaliation to $latte
        Nette\Bridges\ApplicationLatte\UIMacros::install($latte->getCompiler());
        $latte->addProvider('uiControl', $this->linkGenerator);
        
        // set parameters (used as {link} in .latte template)
        $params = [
            'email' => $email,
            'token' => $token
        ];
        
        // html content from latte template
        $html = $latte->renderToString(__DIR__ . '/newsletterRegistration.latte', $params);

        $mail = new Message();
        $mail->setFrom($organisation->short_name . ' <' . $organisation->email . '>');
        $mail->addTo($email);
        $mail->setSubject($organisation->short_name . ' - Registrace k odběru novinek');
        $mail->setHtmlBody($html);

        if($mail) {
            try {
                
                $this->mailer->send($mail);
                
            } catch (\EmailException $e) {
                throw new EmailException('Chyba při registraci emailu do newsletteru! (' . $e->getMessage() . ')');
            }
        }
    }
    
    public function sendUserRegistration($email, $token): void {

        $organisation = $this->database->table('organisation')->get(1);
        
        // create latte
        $latte = $this->latteFactory->create();

        // macro "{link}, n:href" instaliation to $latte
        Nette\Bridges\ApplicationLatte\UIMacros::install($latte->getCompiler());
        $latte->addProvider('uiControl', $this->linkGenerator);
        
        // set parameters (used as {link} in .latte template)
        $params = [
            'email' => $email,
            'token' => $token
        ];
        
        // html content from latte template
        $html = $latte->renderToString(__DIR__ . '/userRegistration.latte', $params);

        $mail = new Message();
        $mail->setFrom($organisation->short_name . ' <' . $organisation->email . '>');
        $mail->addTo($email);
        $mail->setSubject($organisation->short_name . ' - Registrace nového uživatele');
        $mail->setHtmlBody($html);

        if($mail) {
            try {
                
                $this->mailer->send($mail);
                
            } catch (\EmailException $e) {
                throw new EmailException('Chyba při odeslání registračního emailu! (' . $e->getMessage() . ')');
            }
        }
    }
    
    /**
     * Send rank info
     * @param type $id
     * @param type $title
     * @param type $content
     * @param type $stars
     * @param type $creator
     * @throws EmailException
     */
    public function sendRank($id, $title, $content, $stars, $creator): void {

        $organisation = $this->database->table('organisation')->get(1);
        
        // create latte
        $latte = $this->latteFactory->create();

        // macro "{link}, n:href" instaliation to $latte
        Nette\Bridges\ApplicationLatte\UIMacros::install($latte->getCompiler());
        $latte->addProvider('uiControl', $this->linkGenerator);
        
        // set parameters (used as {link} in .latte template)
        $params = [
            'id' => $id,
            'title' => $title,
            'content' => $content,
            'stars' => $stars,
            'creator' => $creator
        ];
        
        // html content from latte template
        $html = $latte->renderToString(__DIR__ . '/rank.latte', $params);

        $mail = new Message();
        $mail->setFrom($organisation->short_name . ' <' . $organisation->email . '>');
        $mail->addTo($organisation->email);
        $mail->setSubject($organisation->short_name . ' - Nové hodnocení na webu');
        $mail->addEmbeddedFile('./img/newsletter.png');
        $mail->setHtmlBody($html);

        if($mail) {
            try {
                
                $this->mailer->send($mail);
                
            } catch (\EmailException $e) {
                throw new EmailException('Chyba při odeslání emailu! (' . $e->getMessage() . ')');
            }
        }
    }
}

class EmailException extends \Exception {}