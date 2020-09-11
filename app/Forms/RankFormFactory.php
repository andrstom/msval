<?php

declare(strict_types = 1);

namespace App\Forms;

use Nette;
use Nette\Application\UI\Form;
use Nette\Security\User;
use App\Model\RankManager;

final class RankFormFactory {

    use Nette\SmartObject;

    /** @var FormFactory */
    private $factory;

    /** @var User */
    private $user;

    /** @var App\Model\RankManager */
    private $rankManager;


    public function __construct(FormFactory $factory,
                                User $user,
                                RankManager $rankManager) {
        $this->factory = $factory;
        $this->user = $user;
        $this->rankManager = $rankManager;
    }

    /**
     * Create rank form
     * @param type $rankId
     * @param \App\Forms\callable $onSuccess
     * @return Form
     */
    public function create($rankId, callable $onSuccess): Form {

        $stars= array(
            '1' => '',
            '2' => '',
            '3' => '',
            '4' => '',
            '5' => '',
        );
        
        $form = $this->factory->create();

        $form->addText('creator', '* Jméno / Přezdívka')
                ->setOption('description', 'Bude zveřejněno u Vašeho hodnocení (např. maminka Janičky, tatínek Pepíka apod.).')
                ->setRequired('Vyplňte Jméno / Přezdívka');

        $form->addText('title', '* Nadpis')
                ->setRequired('Vyplňte Nadpis');

        $form->addTextArea('content', 'Obsah')
                ->setAttribute('rows', 10);

        $form->addRadioList('stars', 'Hvězdičky', $stars)
                ->setRequired('Udělte hvězdičku');

        $form->addSubmit('send', 'Uložit hodnocení')
                ->setHtmlAttribute('class', 'col-lg-12');

        $form->onSuccess[] = function (Form $form, \stdClass $values) use ($rankId, $onSuccess): void {

            if (!$rankId) {

                // Add
                $this->rankManager->add($values);
            } else {

                // Edit
                $this->rankManager->edit($this->user, $values, $rankId);
            }
            $onSuccess();
        };

        return $form;
    }
}