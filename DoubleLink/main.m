//
//  main.m
//  DoubleLink
//
//  Created by beijiXinOg on 2019/6/24.
//  Copyright © 2019年 xiao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct Node {
    int data;
    struct Node *head;
    struct Node *next;
} DoubleLinkNode;


DoubleLinkNode* reverseDoublelink (DoubleLinkNode *node) {
    if (node == NULL) {return NULL;}
    DoubleLinkNode *pre = NULL;
    while (node) {
        // 记录下一个节点
        DoubleLinkNode *nextTemp = node->next;
        // 反转
        node->head = nextTemp;
        node->next = pre;
        // 把前节点置为当前节点
        pre = node;
        // 把当前节点置为下个节点
        node = nextTemp;
    }
    return pre;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //创建节点
        DoubleLinkNode *rootNode = alloca(sizeof(DoubleLinkNode));
        rootNode->data = 10;
        rootNode->head = NULL;
        rootNode->next = NULL;
        
        DoubleLinkNode *node1 = alloca(sizeof(DoubleLinkNode));
        node1->data = 20;
        node1->head = NULL;
        node1->next = NULL;
        
        DoubleLinkNode *node2 = alloca(sizeof(DoubleLinkNode));
        node2->data = 30;
        node2->head = NULL;
        node2->next = NULL;
        
        DoubleLinkNode *node3 = alloca(sizeof(DoubleLinkNode));
        node3->data = 40;
        node3->head = NULL;
        node3->next = NULL;
        
        //链接节点
        rootNode->next = node1;
        
        node1->head = rootNode;
        node1->next = node2;
        
        node2->head = node1;
        node2->next = node3;
        
        node3->head = node2;
        
        // 反转
        DoubleLinkNode *node = reverseDoublelink(rootNode);
        
    }
    return 0;
}
