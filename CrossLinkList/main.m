//
//  main.m
//  CrossLinkList
//
//  Created by beijiXinOg on 2019/7/4.
//  Copyright © 2019年 xiao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 求两个链表： list1、list2的交叉点
 思想：
 分别求出两个链表的长度
 把长链做偏移和短链一样长
 同时移动两个链表的首指针，判断节点是否相等
 相等则找到交叉点
 */

// 定义节点
typedef struct Node {
    int data;
    struct Node *next;
} Node;

/// 计算链表的长度
int getListLength(Node *list) {
    int length = 1;
    while (list->next != NULL) {
        length++;
        list = list->next;
    }
    return length;
}

// 长链表做偏移
Node* relocateNode (Node *list, int offset) {
    Node *node1 = list;
    for (NSInteger i = 0; i < offset; i++) {
        node1 = node1->next;
    }
    return node1;
}

int findCommonNode (Node *list1, Node *list2) {
    // 计算两个链表的长度
    int list1Length = getListLength(list1);
    int list2Length = getListLength(list2);
    
    // 计算两个链表的长度差值
    int offset = abs(list1Length-list2Length);
    
    // 记录长链短链
    Node *longList = list1;
    Node *shortList = list2;
    if (list1Length < list2Length) {
        longList = list2;
        shortList = list1;
    }
    // 长链做偏移 ，偏移后和短链一样长
    longList = relocateNode(longList, offset);
    
    // 同时移动两个链表的首指针
    while (shortList != NULL) {
        if (longList->data == shortList->data) {
            // 如果节点值相等 找到交叉点
            return longList->data;
        }
        longList = longList->next;
        shortList = shortList->next;
    }
    return 0;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Node *node1 = malloc(sizeof(Node));
        node1->data = 1;
        Node *node2 = malloc(sizeof(Node));
        node2->data = 2;
        Node *node3 = malloc(sizeof(Node));
        node3->data = 3;
        Node *node4 = malloc(sizeof(Node));
        node4->data = 4;
        Node *node5 = malloc(sizeof(Node));
        node5->data = 5;
        Node *node6 = malloc(sizeof(Node));
        node6->data = 6;
        
        Node *node7 = malloc(sizeof(Node));
        node7->data = 7;
        
        node1->next = node2;
        node2->next = node3;
        node3->next = node4;
        node4->next = node5;
        node5->next = node6;
        node6->next = NULL;
        
        node7->next = node4;
        
        
        Node *list1 = node1;
        Node *list2 = node7;
        
        
        int commonValue = findCommonNode(list1, list2);
        NSLog(@"commonValue: %d\b", commonValue);
    }
    return 0;
}
