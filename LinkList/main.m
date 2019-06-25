//
//  main.m
//  LinkList
//
//  Created by beijiXinOg on 2019/6/24.
//  Copyright © 2019年 xiao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct Node {
    int data;
    struct Node *next;
} LinkNode;


LinkNode* reverseLink(LinkNode *node){
    if (node == NULL) {return NULL;}
    LinkNode *pre = NULL;
    while (node) {
        LinkNode *nextTemp = node->next;
        node->next = pre;
        pre = node;
        node = nextTemp;
    }
    return pre;
}

LinkNode* deleteLinkElement(LinkNode *node, int element) {
    if (node == NULL) {return NULL;}
    LinkNode *pre = NULL;
    
    while (node) {
        LinkNode *nextTemp = node->next;
        if (node->data == element) {
            if (pre) {
                pre->next = nextTemp;
            } else {
                *node = *nextTemp;
            }
        }
        pre = node;
        node = nextTemp;
    }
    return pre;
}

int main() {
    @autoreleasepool {
        //创建节点
        LinkNode *rootNode = malloc(sizeof(LinkNode));
        rootNode->data = 1;
        rootNode->next = NULL;
        
        LinkNode *node1 = malloc(sizeof(LinkNode));
        node1->data = 2;
        node1->next = NULL;
        
        LinkNode *node2 = malloc(sizeof(LinkNode));
        node2->data = 3;
        node2->next = NULL;
        
        //生成链表
        rootNode->next = node1;
        node1->next = node2;
        
        //反转链表
        LinkNode *node = reverseLink(rootNode);
        
        //删除链表中的值为3元素
        deleteLinkElement(node, 2);
    
    }
    return 0;
}
