//
//  main.m
//  DoubleCirculationLink
//
//  Created by beijiXinOg on 2019/6/25.
//  Copyright © 2019年 xiao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct Node {
    int data;
    struct Node *head;
    struct Node *next;
} DoubleCirculationLinkNode;

void reverseDoubleCirculationLink (DoubleCirculationLinkNode *node) {
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //创建节点
        DoubleCirculationLinkNode *rootNode = alloca(sizeof(DoubleCirculationLinkNode));
        rootNode->data = 10;
        rootNode->head = NULL;
        rootNode->next = NULL;
        
        DoubleCirculationLinkNode *node1 = alloca(sizeof(DoubleCirculationLinkNode));
        node1->data = 20;
        node1->head = NULL;
        node1->next = NULL;
        
        DoubleCirculationLinkNode *node2 = alloca(sizeof(DoubleCirculationLinkNode));
        node2->data = 30;
        node2->head = NULL;
        node2->next = NULL;
        
        DoubleCirculationLinkNode *node3 = alloca(sizeof(DoubleCirculationLinkNode));
        node3->data = 40;
        node3->head = NULL;
        node3->next = NULL;
        
        //连接节点
        rootNode->head = node3;
        rootNode->next = node1;
        
        node1->head = rootNode;
        node1->next = node2;
        
        node2->head = node1;
        node2->next = node3;
        
        node3->head = node2;
        node3->next = rootNode;
    }
    return 0;
}
