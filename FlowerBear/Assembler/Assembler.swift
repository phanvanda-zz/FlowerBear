//
//  Assembler.swift
//  FlowerBear
//
//  Created by Da on 9/10/20.
//  Copyright © 2020 . All rights reserved.
//

protocol Assembler: class,
    AppAssembler,
    LoginAssembler,
    RepositoriesAssembler,
    MainTabbarAssembler,
    HomeAssembler,
    ListAssembler,
    NotiAssembler,
    UserAssembler
{}

final class DefaultAssembler: Assembler {
    
}
