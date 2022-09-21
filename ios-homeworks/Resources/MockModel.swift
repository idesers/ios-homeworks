//
//  MockModel.swift
//  ios-homeworks
//
//  Created by Oleg Skornyakov on 9/21/22.
//

import Foundation


struct MockModel {
    
    static let posts: [Post] = [
        Post(author: "Нетология. Меняем карьеру через образование",
             description: "Технари и гуманитарии: мир разделился на два лагеря. Первые лучше ориентируются в мире цифр, вторые хорошо осваивают языки и искусно пишут сочинения. Мы уверены — это деление условно. Но бывает так, у кого-то больше технических навыков, у кого-то гуманитарных, а кто-то с лёгкостью объединяет и то и другое.\n\nНа какой вы стороне? Давайте проверим, кого больше.",
             image: "PostImage1",
             likes: 6,
             views: 5200),
        
        Post(author: "Нетология. Меняем карьеру через образование",
             description: "Многие студенты и выпускники мечтают о карьере в крупной компании. Возникает вопрос: как устроиться туда без опыта? Отличный вариант для начинающих — стажировки. Они дают возможность развить навыки, поработать над интересными проектами и стать частью команды. По результатам работы стажёры могут получить оффер и продолжить работу в компании.\n\nРассказываем, где искать стажировки для тех, кто начинает карьеру в IT.",
             image: "PostImage2",
             likes: 38,
             views: 6900),
        
        Post(author: "VC.RU Стартапы и бизнес",
             description: "Очевидный минус удалёнки — нельзя задать вопрос коллеге за соседним столом. Уведомления же в чатах часто выбивают из колеи, вынуждают быть всё время в онлайне и даже вызывают чувство вины.\n\nНо справиться с этим можно — например, просматривать мессенджеры по графику и выяснять всё важное заранее. Материал издания Bubble",
             image: "PostImage3",
             likes: 45,
             views: 14000),
        
        Post(author: "VC.RU Стартапы и бизнес",
             description: "С покупкой Figma за $20 млрд Adobe рассчитывает привлечь новых клиентов и увеличить выручку. Сам сервис говорит о новых возможностях. \n\nНо не все акционеры и пользователи разделяют этот оптимизм, а некоторые и вовсе «поминают» Figma и шутят, что в будущем будут качать «кряки» для неё с торрент-трекеров",
             image: "PostImage4",
             likes: 39,
             views: 15000),
    ]
    
}
